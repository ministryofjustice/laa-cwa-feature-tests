Given('the user prepares to add outcomes in the {string} category of law') do |category_of_law|
  case category_of_law
  when 'Discrimination'
    ref = 'LEGAL HELP.EDU#10'
  when 'Education'
    ref = 'LEGAL HELP.EDU#9'
  when 'Asylum'
    ref = 'LEGAL HELP.IMMAS#5'
  when 'Immigration'
    ref = 'LEGAL HELP.IMMOT#4'
  else
    raise "unmapped category of law '#{category_of_law}'"
  end

  @category_of_law = category_of_law

  step("user prepares to submit outcomes for test provider \"#{ref}\"")
end

Given('the user wants to add outcomes with any Matter Type 1 from:') do |description|
  @config = Helpers::Pricing.config_by(
    category_of_law: @category_of_law,
    matter_type1_description: description
  )

  @matter_type_code = @config.matter_type_code
  @standard_fee = @config.standard_fee
  @max_price_cap = @config.max_price_cap
  @max_profit_cost = @config.max_profit_cost
  @escape_fee_threshold = @config.escape_fee_threshold
  @escape_fee_threshold_formula = @config.escape_fee_threshold_formula
  @additional_payments = @config.additional_payments

  log '-------------------------------------------------------'
  log '  This test will use a random existing configuration:'
  log sprintf '%25s  %s', 'Matter Type', @matter_type_code
  log sprintf '%25s  %s', 'Standard Fee', (@standard_fee ? "£#{@standard_fee}" : 'none (hourly rates?)')
  log sprintf '%25s  %s', 'Max Price Cap', (@max_price_cap ? "£#{@max_price_cap}" : 'none')
  log sprintf '%25s  %s', 'Max Profit Cost', "£#{@max_profit_cost}"
  log sprintf '%25s  %s', 'Escape fee threshold', (@escape_fee_threshold ? "£#{@escape_fee_threshold} (#{@escape_fee_threshold_formula})" : 'none')
  log sprintf '%25s  %s', 'Additional Payments', (@additional_payments&.any? ? 'yes' : 'no')
  @additional_payments&.each&.with_index(1) do |additional_payment, i|
    log sprintf '%25s  £%s', "#{i}. #{additional_payment.description}", additional_payment.value
  end
  log '-------------------------------------------------------'
end

When('the user confirms the submission') do
  step('user confirms the submission')
end

When('the user is on the pricing outcome details page') do
  step('user is on the pricing outcome details page')
end

When('the user adds outcomes with:') do |description|
  calculator = Helpers::Pricing.calculator_from(config: @config)

  # TODO: add logs to print the random data generated

  case description
  when 'profit + counsel costs exceeding the standard fee of £1.00'
    calculator.random_profit_and_counsel_costs!(min_total: 20, max_total: @standard_fee)
    calculator.exceed_profit_or_counsel_cost_by!(excess: 1)
  when 'profit and counsel costs according to hourly rates'
    calculator.random_profit_and_counsel_costs!(min_total: 20, max_total: @max_price_cap || @max_profit_cost)
  when 'profit + counsel costs exceeding the max price cap'
    calculator.random_profit_and_counsel_costs!(min_total: 20.01, max_total: @max_price_cap || @max_profit_cost)
    calculator.exceed_profit_or_counsel_cost_by!(excess: 0.01)
  when 'additional payments'
    calculator.random_additional_payments!
    calculator.use_max_profit_cost!(include_additional_payments: true)
  when 'disbursements and disbursements VAT'
    calculator.use_max_profit_cost!
    calculator.random_disbursments_and_vat!(min: 50, max: 200)
  when 'VAT indicator enabled for profit and counsel costs'
    calculator.use_max_profit_cost!
    calculator.enable_vat_indicator!
  when /profit \+ counsel costs (\(minus additional payments\)\s)?(NOT\s)?exceeding the escape threshold?/
    include_additional_payments = Regexp.last_match(1)
    exceeding_escape_fee_thresold = !Regexp.last_match(2)

    calculator.random_additional_payments! if include_additional_payments
    calculator.random_profit_and_counsel_costs!(min_total: 20.01, max_total: @escape_fee_threshold, include_additional_payments: include_additional_payments)
    calculator.reduce_profit_or_counsel_cost_by!(decrement: 0.01) if exceeding_escape_fee_thresold

    gross_total = (calculator.profit_cost + calculator.counsel_cost).round(2)
    reduced_total = (gross_total - calculator.tot_additional_payments).round(2)

    log '-------------------------------------------------------'
    log sprintf '%s  %-35s  %s', 'Abbr', 'Item', 'Value'
    log sprintf '%s  %-35s  £%s', '(PC)', 'Profit cost', calculator.profit_cost
    log sprintf '%s  %-35s  £%s', '(CC)', 'Counsel cost', calculator.counsel_cost
    log sprintf '%s  %-35s  £%s', '(SF)', 'Standard fee(s)', @standard_fee
    log sprintf '%s  %-35s  £%s', '(AP)', 'Additional payments', calculator.tot_additional_payments
    log 'Note: Profit cost (PC) includes any additional payment (AP).'
    log sprintf '%s  %-35s  £%s', '(GT)', 'Gross total = (PC) + (CC)', gross_total
    log sprintf '%s  %-35s  £%s', '(RT)', 'Reduced total = (GT) - (AP)', reduced_total
    log sprintf '%s  %-35s  £%s', '(ET)', "Escape threshold = #{@escape_fee_threshold_formula.gsub('standard_fee', '(SF)')}", @escape_fee_threshold
    log '  Condition to escape the standard fee: (RT) >= (ET) '
    log "  Expected to meet condition: #{(reduced_total >= @escape_fee_threshold).to_s.upcase}"
    log '-------------------------------------------------------'
  else
    raise "unmapped scenario '#{description}'"
  end

  @lines = calculator.generate_pricing_lines

  doc = build_bulkload_xml(
    submission: @submission,
    matter_types: [@matter_type_code],
    new_lines: @lines
  )
  file_name = save_tmp_bulkload_xml(doc)

  bulk_load_page = BulkLoadPage.new
  bulk_load_page.bulk_load_file.send_keys(file_name)
  with_delay(0.75) { bulk_load_page.next_button.click }

  step('the user confirms the submission')
end

Then('the outcomes are priced at:') do |formula|
  step('the user is on the pricing outcome details page')

  line = @lines.first # Note: assumes price to be the same for all outcomes
  fees = formula.split('+').map(&:strip)

  log sprintf '%3s  %25s  %3s', 'Qty', 'Item', 'Amount'
  log '-------------------------------------------------------'

  final_price = fees.reduce(0) do |tot, fee|
    case fee
    when 'standard fee'
      if @standard_fee.nil?
        raise "no standard fee for '#{@matter_type_code} (maybe hourly rates?)'"
      end
      tot += @standard_fee
      log sprintf '%3s  %25s  £%s', 1, 'Standard Fee', @standard_fee
    when 'hourly rates'
      profit_cost = line.fetch(:profit_cost, 0)
      counsel_cost = line.fetch(:counsel_cost, 0)
      tot += (profit_cost + counsel_cost)
      log sprintf '%3s  %25s  £%s', nil, 'Profit cost', profit_cost
      log sprintf '%3s  %25s  £%s', nil, 'Counsel cost', counsel_cost
    when 'max price cap'
      if @max_price_cap.nil?
        raise "no max price cap for '#{@matter_type_code}'"
      end
      tot += @max_price_cap
      log sprintf '%3s  %25s  £%s', 1, 'Max Price Cap', @max_price_cap
    when 'additional payments'
      @additional_payments.each do |additional_payment|
        units = line.fetch(additional_payment.name, 0)
        units == 'N' ? units = 0 : (units == 'Y' ? units = 1 : nil)
        if units > 0
          additional_payment_value = (additional_payment.value * units).round(2)
          log sprintf '%3s  %25s  £%s', units, additional_payment.description, additional_payment_value
          tot += additional_payment_value
        end
      end
    when 'disbursements'
      disbursements_amount = line.fetch(:disbursements_amount, 0)
      tot += disbursements_amount
      log sprintf '%3s  %25s  £%s', nil, 'Disbursements Amount', disbursements_amount
    when 'disbursements VAT'
      disbursements_vat = line.fetch(:disbursements_vat, 0)
      tot += disbursements_vat
      log sprintf '%3s  %25s  £%s', nil, 'Disbursements VAT', disbursements_vat
    when 'VAT'
      vat_amount = (tot * 0.20).round(2)
      tot += vat_amount
      log sprintf '%3s  %25s  £%s', nil, 'VAT (on items above)', vat_amount
    end
    tot
  end

  log '-------------------------------------------------------'
  log sprintf '%3s  %25s  £%s', nil, 'TOTAL', final_price

  submission_details_page = SubmissionDetailsPage.new
  expected_price = sprintf('£ %.2f', final_price)

  if submission_details_page.outcomes.count == 0
    raise 'no outcomes on the page'
  end

  submission_details_page.outcomes.each do |outcome|
    STDOUT.print "    Checking pricing for #{outcome.ufn.text}"
    actual_price = outcome.value.text.gsub(',', '')
    STDOUT.puts ": #{actual_price.delete(' ')}"
    expect(actual_price).to eq(expected_price)
  end
end

Then(/the outcomes are (NOT\s)?flagged as escape fee cases/) do |negated|
  step('the user is on the pricing outcome details page')

  submission_details_page = SubmissionDetailsPage.new

  if submission_details_page.outcomes.count == 0
    raise 'no outcomes on the page'
  end

  submission_details_page.outcomes.each do |outcome|
    STDOUT.print "    Checking escape fee flag for #{outcome.ufn.text}"
    found_flag = outcome.has_escape_fee_img?(wait: 0)
    STDOUT.puts ": #{(found_flag ? 'found' : 'not found').upcase}"
    expected_flag = negated ? false : true
    expect(found_flag).to eq(expected_flag)
  end
end
