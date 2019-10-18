class AddOutcomePage < SitePrism::Page
  set_url '/OA_HTML/OA.jsp?page=/xxlsc/oracle/apps/xxlsc/am/webui/SubmissionPG*'

  def self.field(name, type)
    [
      :xpath,
      "//span[contains(text(), \"#{name}\")]/ancestor::td[1]/following-sibling::td[2]/#{type}|" +
      "//span[contains(text(), \"#{name}\")]/ancestor::td[1]/following-sibling::td[2]/*/#{type}"
    ]
  end

  element :matter_type, :xpath, '//*[@id="MatterType"]'

  element :schedule_reference, *field("Schedule Reference", :input)
  element :case_reference_number, *field("Case Reference Number", :input)
  element :case_start_date, *field("Case Start Date", :input)
  element :case_id, *field("Case ID", :input)
  element :procurement_area, *field("Procurement Area", :input)
  element :access_point, *field("Access Point", :input)
  element :client_forename, *field("Client Forename", :input)
  element :client_surname, *field("Client Surname", :input)
  element :client_date_of_birth, *field("Client Date of Birth", :input)
  element :ucn, *field("UCN", :input)
  element :postal_application_accepted, *field("Postal Application Accepted", :select)
  element :gender, *field("Gender", :select)
  element :ethnicity, *field("Ethnicity", :select)
  element :disability, *field("Disability", :select)
  element :client_postcode, *field("Client Postcode", :input)
  element :case_concluded_date, *field("Case Concluded Date", :input)
  element :advice_time, *field("Advice Time", :input)
  element :travel_time, *field("Travel Time", :input)
  element :waiting_time, *field("Waiting Time", :input)
  element :profit_costs_excluding_vat, *field("Profit Costs excluding VAT", :input)
  element :disbursements_excluding_vat, *field("Disbursements excluding VAT", :input)
  element :counsel_costs_excluding_vat, *field("Counsel Costs excluding VAT", :input)
  element :disbursements_vat_amount, *field("Disbursements VAT amount", :input)
  element :profit_and_counsel_vat_indicator, *field("Profit and Counsel VAT Indicator", :select)
  element :london_rate, *field("London Rate", :select)
  element :tolerance_indicator, *field("Tolerance indicator", :select)
  element :travel_and_waiting_costs_excluding_vat, *field("Travel and Waiting costs excluding VAT", :input)
  element :value_of_costs_damages_awarded, *field("Value of Costs/Damages awarded", :input)
  element :local_authority_number, *field("Local Authority number", :input)
  element :client_type, *field("Client Type", :select)
  element :stage_reached, *field("Stage Reached", :select)
  element :outcome_for_client, *field("Outcome for client", :select)
  element :case_stage_level, *field("Case stage(s) / level(s)", :select)
  element :exemption_criteria_satisfied, *field("Exemption Criteria Satisfied", :select)
  element :exceptional_case_funding_reference, *field("Exceptional Case Funding Reference", :input)
  element :transfer_date, *field("Transfer Date", :input)

  element :save_button, :xpath, '//*[@id="Apply_uixr"]'

  def add_outcome(values)
    matter_type.set(values[:matter_type])
    matter_type.send_keys(:return)
    wait_until_schedule_reference_visible(wait: 10)
    schedule_reference.set(values[:schedule_reference])
    case_reference_number.set(values[:case_reference_number])
    case_start_date.set(values[:case_start_date])
    case_id.set(values[:case_id])
    procurement_area.set(values[:procurement_area])
    procurement_area.send_keys(:tab)
    access_point.set(values[:access_point])
    access_point.send_keys(:tab)
    sleep 1
    client_forename.set(values[:client_forename])
    client_surname.set(values[:client_surname])
    client_date_of_birth.set(values[:client_date_of_birth])
    ucn.set(values[:ucn])
    postal_application_accepted.select(values[:postal_application_accepted])
    gender.select(values[:gender])
    ethnicity.select(values[:ethnicity])
    disability.select(values[:disability])
    client_postcode.set(values[:client_postcode])
    case_concluded_date.set(values[:case_concluded_date])
    case_concluded_date.send_keys(:tab)
    advice_time.set(values[:advice_time])
    travel_time.set(values[:travel_time])
    waiting_time.set(values[:waiting_time])
    profit_costs_excluding_vat.set(values[:profit_costs_excluding_vat])
    disbursements_excluding_vat.set(values[:disbursements_excluding_vat])
    counsel_costs_excluding_vat.set(values[:counsel_costs_excluding_vat])
    disbursements_vat_amount.set(values[:disbursements_vat_amount])
    profit_and_counsel_vat_indicator.select(values[:profit_and_counsel_vat_indicator])
    london_rate.select(values[:london_rate]) if values[:london_rate]
    tolerance_indicator.select(values[:tolerance_indicator]) if values[:tolerance_indicator]
    travel_and_waiting_costs_excluding_vat.set(values[:travel_and_waiting_costs_excluding_vat])
    value_of_costs_damages_awarded.set(values[:value_of_costs_damages_awarded]) if values[:value_of_costs_damages_awarded]
    stage_reached.select(values[:stage_reached]) if values[:stage_reached]
    local_authority_number.set(values[:local_authority_number]) if values[:local_authority_number]
    client_type.select(values[:client_type]) if values[:client_type]
    outcome_for_client.select(values[:outcome_for_client])
    case_stage_level.select(values[:case_stage_level]) if values[:case_stage_level]
    exemption_criteria_satisfied.select(values[:exemption_criteria_satisfied])
    exceptional_case_funding_reference.set(values[:exceptional_case_funding_reference]) if values[:exceptional_case_funding_reference]
    transfer_date.set(values[:transfer_date]) if values[:transfer_date]
    save_button.click
  end
end
