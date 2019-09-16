class AddOutcomePage < SitePrism::Page
  set_url '/OA_HTML/OA.jsp?page=/xxlsc/oracle/apps/xxlsc/am/webui/SubmissionPG*'

  element :matter_type, :xpath, '//*[@id="MatterType"]'
  element :schedule_reference, :xpath, '//*[@id="LinesDFF3"]'
  element :case_reference_number, :xpath, '//*[@id="LinesDFF4"]'
  element :case_start_date, :xpath, '//*[@id="LinesDFF5"]'
  element :case_id, :xpath, '//*[@id="LinesDFF6"]'
  element :procurement_area, :xpath, '//*[@id="LinesDFF7"]'
  element :access_point, :xpath, '//*[@id="LinesDFF8"]'
  element :client_forename, :xpath, '//*[@id="LinesDFF10"]'
  element :client_surname, :xpath, '//*[@id="LinesDFF11"]'
  element :client_date_of_birth, :xpath, '//*[@id="LinesDFF12"]'
  element :ucn, :xpath, '//*[@id="LinesDFF13"]'
  element :postal_application_accepted, :xpath, '//*[@id="LinesDFF14"]'
  element :gender, :xpath, '//*[@id="LinesDFF15"]'
  element :ethnicity, :xpath, '//*[@id="LinesDFF16"]'
  element :disability, :xpath, '//*[@id="LinesDFF17"]'
  element :postcode, :xpath, '//*[@id="LinesDFF18"]'
  element :case_concluded_date, :xpath, '//*[@id="LinesDFF19"]'
  element :advice_time, :xpath, '//*[@id="LinesDFF20"]'
  element :travel_time, :xpath, '//*[@id="LinesDFF21"]'
  element :waiting_time, :xpath, '//*[@id="LinesDFF22"]'
  element :profit_costs_excluding_vat, :xpath, '//*[@id="LinesDFF23"]'
  element :disbursements_excluding_vat, :xpath, '//*[@id="LinesDFF24"]'
  element :counsel_costs_excluding_vat, :xpath, '//*[@id="LinesDFF25"]'
  element :disbursements_vat_amount, :xpath, '//*[@id="LinesDFF26"]'
  element :profit_and_counsel_vat_indicator, :xpath, '//*[@id="LinesDFF27"]'
  element :london_rate, :xpath, '//*[@id="LinesDFF28"]'
  element :travel_and_waiting_costs_excluding_vat, :xpath, '//*[@id="LinesDFF29"]'
  element :value_of_costs_damages_awarded, :xpath, '//*[@id="LinesDFF30"]'
  element :local_authority_number, :xpath, '//*[@id="LinesDFF31"]'
  element :client_type, :xpath, '//*[@id="LinesDFF32"]'
  element :stage_reached, :xpath, '//*[@id="LinesDFF33"]'
  element :outcome_for_client, :xpath, '//*[@id="LinesDFF34"]'
  element :case_stage_level, :xpath, '//*[@id="LinesDFF35"]'
  element :exemption_criteria_satisfied, :xpath, '//*[@id="LinesDFF36"]'
  element :exceptional_case_funding_reference, :xpath, '//*[@id="LinesDFF37"]'
  element :transfer_date, :xpath, '//*[@id="LinesDFF38"]'
  element :save_button, :xpath, '//*[@id="Apply_uixr"]'

  def add_outcome(values)
    matter_type.set(values[:matter_type])
    matter_type.send_keys(:return)
    wait_until_schedule_reference_visible(wait: 10)
    schedule_reference.set(values[:submission_reference])
    case_reference_number.set(values[:case_ref_number])
    case_start_date.set(values[:case_start_date])
    case_id.set(values[:case_id])
    procurement_area.set(values[:procurement_area])
    procurement_area.send_keys(:tab)
    access_point.set(values[:access_point])
    access_point.send_keys(:tab)
    client_forename.set(values[:client_forename])
    client_surname.set(values[:client_surname])
    client_date_of_birth.set(values[:client_dob])
    ucn.set(values[:ucn])
    sleep 0.5
    postal_application_accepted.select(values[:postal_application_accepted])
    gender.select(values[:gender])
    ethnicity.select(values[:ethnicity])
    disability.select(values[:disability])
    postcode.set(values[:postcode])
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
    london_rate.select(values[:london_rate])
    travel_and_waiting_costs_excluding_vat.set(values[:travel_and_waiting_costs_excluding_vat])
    value_of_costs_damages_awarded.set(values[:value_of_costs_damages_awarded])
    local_authority_number.set(values[:local_authority_number])
    client_type.select(values[:client_type])
    outcome_for_client.select(values[:outcome_for_client])
    case_stage_level.select(values[:case_stage_level])
    exemption_criteria_satisfied.select(values[:exemption_criteria_satisfied])
    save_button.click
  end
end
