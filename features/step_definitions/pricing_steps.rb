Given('the user prepares to add outcomes in the {string} category of law') do |category_of_law|
  case category_of_law
  when 'Asylum'
    ref = 'LEGAL HELP.IMMAS#5'
  when 'Immigration'
    ref = 'LEGAL HELP.IMMOT#4'
  else
    raise "unmapped category of law '#{category_of_law}'"
  end

  @config = Helpers::SubmissionConfig.by_category_of_law(category_of_law)

  step("user prepares to submit outcomes for test provider \"#{ref}\"")
end

Given('the user wants to add outcomes with any Matter Type 1 from:') do |description|
  all_matter_types = @config.matter_types_by_matter_type1_description(description)
  sample_matter_type = all_matter_types.sample

  @all_matter_types = all_matter_types

  raise "no matter types available for '#{description}'" unless sample_matter_type

  @matter_type_code = sample_matter_type.name
  @standard_fee = sample_matter_type.standard_fee&.value
  @additional_payments = sample_matter_type.additional_payments || []

  STDOUT.puts '-------------------------------------------------------'
  STDOUT.puts '  This test will use a random existing configuration:'
  STDOUT.puts sprintf '%25s  %s', 'Matter Type', sample_matter_type.name
  STDOUT.puts sprintf '%25s  £%s', 'Standard Fee', sample_matter_type.standard_fee&.value||'none (hourly rates)'
  STDOUT.puts sprintf '%25s  %s', 'Additional Payments', (sample_matter_type.additional_payments&.any? ? 'yes' : 'no')
  sample_matter_type.additional_payments&.each&.with_index(1) do |additional_payment, i|
    STDOUT.puts sprintf '%25s  £%s', "#{i}. #{additional_payment.description}", additional_payment.value
  end
  STDOUT.puts '-------------------------------------------------------'
end

When('the user confirms the submission') do
  step('user confirms the submission')
end

When('the user is on the pricing outcome details page') do
  step('user is on the pricing outcome details page')
end

When('the user adds outcomes with:') do |description|
  case description
  when 'profit + counsel costs exceeding the standard fee of £1.00'
    # randomly distribute the standard fee value between profit and counsel cost
    profit_costs_offset = rand(20..@standard_fee-20)
    profit_cost = @standard_fee - profit_costs_offset
    counsel_cost = profit_costs_offset

    # randomly add £1.00 to either profit or counsel cost
    rand(0..1) == 0 ? (profit_cost += 1) : (counsel_cost += 1)

    @lines = [
        { profit_cost: profit_cost, counsel_cost: counsel_cost }
      ]
  when 'total profit costs according to hourly rates'
    profit_cost = @config.max_profit_cost

    @lines = [
        { profit_cost: profit_cost }
      ]
  when 'additional payments'
    profit_cost = @config.max_profit_cost if @standard_fee.nil?

    # assign a random quantity to all payable additional payments
    additional_payments_hash =
      @additional_payments
        .map(&:name)
        .zip([*1..@additional_payments.count]
          .sample(@additional_payments.count))
        .to_h

    if additional_payments_hash[:substantive_hearing]
      additional_payments_hash[:substantive_hearing] = (rand(0..1) == 0 ? 'N' : 'Y')
    end

    @lines = [
      {
        profit_cost: (@standard_fee || profit_cost)
      }.merge(**additional_payments_hash),
    ]
  when 'disbursements and disbursements VAT'
    profit_cost = @config.max_profit_cost if @standard_fee.nil?

    # assign random disbursements values
    disbursements_amount = rand(50..200)
    disbursements_vat = (disbursements_amount * 0.20).round(2)

    @lines = [
      {
        profit_cost: (@standard_fee || profit_cost),
        disbursements_amount: disbursements_amount,
        disbursements_vat: disbursements_vat
      },
    ]
  when 'VAT indicator enabled for profit and counsel costs'
    profit_cost = @config.max_profit_cost if @standard_fee.nil?

    @lines = [
      {
        profit_cost: (@standard_fee || profit_cost),
        vat_indicator: 'Y'
      },
    ]
  when 'exemption criteria separated migrant child'
    profit_cost = @config.max_profit_cost if @standard_fee.nil?

    @lines = [
      {
        profit_cost: @standard_fee ? rand(@standard_fee+100..@standard_fee+500) : profit_cost,
        counsel_cost: 100,
        exemption_criteria_satisfied: 'CM001'
      },
    ]

  when /profit \+ counsel costs (\(minus additional payments\)\s)?(NOT\s)?exceeding three times the standard fee\(s\) \+ £1.00/
    additional_payments_value = 0
    additional_payments_hash = {}

    if Regexp.last_match(1)
      # assign a random quantity to all payable additional payments
      additional_payments_hash =
        @additional_payments
          .map(&:name)
          .zip([*1..@additional_payments.count]
            .sample(@additional_payments.count))
          .to_h

      if additional_payments_hash[:substantive_hearing]
        additional_payments_hash[:substantive_hearing] = rand(0..1)
      end

      additional_payments_value =
        additional_payments_hash.reduce(0) do |tot, (name, units)|
          tot +=
            (@additional_payments.find do |additional_payment|
              additional_payment.name == name
            end.value * units)
        end

      if additional_payments_hash[:substantive_hearing]
        additional_payments_hash[:substantive_hearing] =
          additional_payments_hash[:substantive_hearing] == 0 ? 'N' : 'Y'
      end
    end

    standard_fees = @standard_fee # only one for this test, only one stage
    escape_threshold = (standard_fees * 3).round(2)

    # randomly distribute the escape_threshold value between profit and counsel costs
    profit_costs_offset = rand(20..escape_threshold-20)
    profit_cost = escape_threshold - profit_costs_offset
    counsel_cost = profit_costs_offset

    # randomly add £1.00 to either profit of counsel cost, unless negated in the assertion
    if !Regexp.last_match(2)
      rand(0..1) == 0 ? (profit_cost += 1) : (counsel_cost += 1)
    end

    gross_total = profit_cost + counsel_cost + additional_payments_value
    reduced_total = gross_total - additional_payments_value

    STDOUT.puts '-------------------------------------------------------'
    STDOUT.puts sprintf '%s  %-35s  %s', 'Abbr', 'Item', 'Value'
    STDOUT.puts
    STDOUT.puts sprintf '%s  %-35s  £%s', '(PC)', 'Profit cost', profit_cost
    STDOUT.puts sprintf '%s  %-35s  £%s', '(CC)', 'Counsel cost', counsel_cost
    STDOUT.puts sprintf '%s  %-35s  £%s', '(SF)', 'Standard fee(s)', standard_fees
    STDOUT.puts sprintf '%s  %-35s  £%s', '(AP)', 'Additional payments', additional_payments_value
    STDOUT.puts
    STDOUT.puts sprintf '%s  %-35s  £%s', '(GT)', 'Gross total = (PC) + (CC) + (AP)', gross_total
    STDOUT.puts sprintf '%s  %-35s  £%s', '(RT)', 'Reduced total = (GT) - (AP)', reduced_total
    STDOUT.puts sprintf '%s  %-35s  £%s', '(ET)', 'Escape threshold = (SF) * 3', escape_threshold
    STDOUT.puts
    STDOUT.puts '  Condition to escape the standard fee: (RT) > (ET) '
    STDOUT.puts "  Expected to meet condition: #{(reduced_total > escape_threshold).to_s.upcase}"
    STDOUT.puts '-------------------------------------------------------'

    @lines = [
      {
        profit_cost: profit_cost + additional_payments_value,
        counsel_cost: counsel_cost
      }.merge(**additional_payments_hash)
    ]
  else
    raise "unmapped scenario '#{description}'"
  end

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

  STDOUT.puts
  STDOUT.puts sprintf '%3s  %25s  %3s', 'Qty', 'Item', 'Amount'
  STDOUT.puts '-------------------------------------------------------'

  final_price = fees.reduce(0) do |tot, fee|
    case fee
    when 'standard fee'
      if @standard_fee.nil?
        raise "no standard fee for '#{@matter_type_code} (maybe hourly rates?)'"
      end
      tot += @standard_fee
      STDOUT.puts sprintf '%3s  %25s  £%s', 1, 'Standard Fee', @standard_fee
    when 'hourly rates'
      profit_cost = line.fetch(:profit_cost, 0)
      counsel_cost = line.fetch(:counsel_cost, 0)
      tot += (profit_cost + counsel_cost)
      STDOUT.puts sprintf '%3s  %25s  £%s', nil, 'Profit cost', profit_cost
      STDOUT.puts sprintf '%3s  %25s  £%s', nil, 'Counsel cost', counsel_cost
    when 'additional payments'
      @additional_payments.each do |additional_payment|
        units = line.fetch(additional_payment.name, 0)
        units == 'N' ? units = 0 : (units == 'Y' ? units = 1 : nil)
        if units > 0
          additional_payment_value = (additional_payment.value * units).round(2)
          STDOUT.puts sprintf '%3s  %25s  £%s', units, additional_payment.description, additional_payment_value
          tot += additional_payment_value
        end
      end
    when 'disbursements'
      disbursements_amount = line.fetch(:disbursements_amount, 0)
      tot += disbursements_amount
      STDOUT.puts sprintf '%3s  %25s  £%s', nil, 'Disbursements Amount', disbursements_amount
    when 'disbursements VAT'
      disbursements_vat = line.fetch(:disbursements_vat, 0)
      tot += disbursements_vat
      STDOUT.puts sprintf '%3s  %25s  £%s', nil, 'Disbursements VAT', disbursements_vat
    when 'VAT'
      vat_amount = (tot * 0.20).round(2)
      tot += vat_amount
      STDOUT.puts sprintf '%3s  %25s  £%s', nil, 'VAT (on items above)', vat_amount
    end
    tot
  end

  STDOUT.puts '-------------------------------------------------------'
  STDOUT.puts sprintf '%3s  %25s  £%s', nil, 'TOTAL', final_price
  STDOUT.puts

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
    STDOUT.puts ": #{found_flag ? 'yes' : 'no'}"
    expected_flag = negated ? false : true
    expect(found_flag).to eq(expected_flag)
  end
end
