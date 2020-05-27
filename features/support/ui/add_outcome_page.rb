class AddOutcomePage < SitePrism::Page
  set_url '/OA_HTML/OA.jsp?page=/xxlsc/oracle/apps/xxlsc/am/webui/SubmissionPG*'

  def self.field(name, type)
    [
      :xpath,
      "(//span[contains(text(), \"#{name}\")]/ancestor::td[1]/following-sibling::td[2]/#{type}|" +
      "//span[contains(text(), \"#{name}\")]/ancestor::td[1]/following-sibling::td[2]/*/#{type})[1]"
    ]
  end

  element :default_form, :xpath, '//*[@id="DefaultFormName"]'
  element :matter_type, :xpath, '//*[@id="MatterType"]'
  element :claim_type, :xpath, '//*[@id="ClaimTypeDropDown"]'
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

  element :home_office_ucn, 'input[name="LinesDFF16"]'
  element :legacy_case, *field("Legacy Case", :select)
  element :ho_interview, *field("HO Interview", :select)
  element :ait_hearing_centre, *field("AIT Hearing Centre", :select)
  element :adjourned_hearing_fee, *field("Adjourned Hearing Fee", :select)
  element :detention_travel_and_waiting_costs_excluding_vat, *field("Detention Travel & Waiting Costs Excluding VAT", :input)
  element :jr_form_filling_costs_excluding_vat, *field("JR /Form Filling costs excluding VAT", :input)
  element :cmrh_oral, *field("CMRH Oral", :select)
  element :cmrh_telephone, *field("CMRH Telephone", :select)
  element :substantive_hearing, *field("Substantive Hearing", :select)
  element :disbursement_prior_authority_number, *field("Disbursement Prior Authority Number", :input)
  element :irc_surgery, *field("IRC Surgery", :select)
  element :surgery_date, *field("Surgery Date", :input)
  element :no_of_clients_seen_at_the_surgery, *field("Number of Clients Seen at the Surgery", :input)
  element :no_of_surgery_clients, *field("Number of Surgery Clients Resulting in a Legal Help Matter Opened", :input)

  element :errors, :xpath, '//*[@id="FwkErrorBeanId"]'

  def form_reloaded?
    default_form['reloading'] == '0'
  end

  WAIT_FORM_RELOAD_JS = <<-JS
(function(){
  var oldSubmitForm = submitForm
  submitForm = function(saveForm, saveDoValidate, saveParameters) {
      var defaultForm = document.querySelector('#DefaultFormName')
      defaultForm.setAttribute('reloading', 1)
      return new Promise((resolve, _reject) => {
        resolve(oldSubmitForm(saveForm, saveDoValidate, saveParameters))
        if (saveParameters['PageReload']) {
          defaultForm.setAttribute('reloading', 0)
        }
      })
  }
})();
JS

  def set_value_sync(element, value)
    if !defined?(@injected_wait_form_reload_js)
      page.execute_script(WAIT_FORM_RELOAD_JS)
      @injected_wait_form_reload_js = true
    end
    element.set(value)
    element.send_keys(:tab)
    25.times do
      sleep(0.1) && form_reloaded? || next
    end
  end

  def add_outcome(values)
    matter_type.set(values[:matter_type])
    matter_type.send_keys(:tab)
    wait_until_claim_type_visible(wait: 10)
    claim_type.select(values[:claim_type])
    wait_until_schedule_reference_visible(wait: 10)
    schedule_reference.set(values[:schedule_reference])
    case_reference_number.set(values[:case_reference_number])
    case_start_date.set(values[:case_start_date])
    case_id.set(values[:case_id])
    set_value_sync(procurement_area, values[:procurement_area])
    set_value_sync(access_point, values[:access_point])
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

    home_office_ucn.set(values[:home_office_ucn]) if values[:home_office_ucn]
    legacy_case.select(values[:legacy_case]) if values[:legacy_case]
    ho_interview.select(values[:ho_interview]) if values[:ho_interview]
    ait_hearing_centre.select(values[:ait_hearing_centre]) if values[:ait_hearing_centre]
    adjourned_hearing_fee.set(values[:adjourned_hearing_fee]) if values[:adjourned_hearing_fee]
    detention_travel_and_waiting_costs_excluding_vat.set(values[:detention_travel_and_waiting_costs_excluding_vat]) if values[:detention_travel_and_waiting_costs_excluding_vat]
    jr_form_filling_costs_excluding_vat.set(values[:jr_form_filling_costs_excluding_vat]) if values[:jr_form_filling_costs_excluding_vat]
    cmrh_oral.select(values[:cmrh_oral]) if values[:cmrh_oral]
    cmrh_telephone.select(values[:cmrh_telephone]) if values[:cmrh_telephone]
    substantive_hearing.select(values[:substantive_hearing]) if values[:substantive_hearing]
    disbursement_prior_authority_number.set(values[:disbursement_prior_authority_number]) if values[:disbursement_prior_authority_number]
    irc_surgery.select(values[:irc_surgery]) if values[:irc_surgery]
    surgery_date.set(values[:surgery_date]) if values[:surgery_date]
    no_of_clients_seen_at_the_surgery.set(values[:no_of_clients_seen_at_the_surgery]) if values[:no_of_clients_seen_at_the_surgery]
    no_of_surgery_clients.set(values[:no_of_surgery_clients]) if values[:no_of_surgery_clients]

    exemption_criteria_satisfied.select(values[:exemption_criteria_satisfied]) if values[:exemption_criteria_satisfied]
    exceptional_case_funding_reference.set(values[:exceptional_case_funding_reference]) if values[:exceptional_case_funding_reference]
    transfer_date.set(values[:transfer_date]) if values[:transfer_date]

    save_button.click
  end
end
