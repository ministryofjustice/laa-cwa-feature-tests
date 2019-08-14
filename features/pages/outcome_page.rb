module OutcomePage

  def add_outcome(values, page)
    puts 'add_outcome method'
    page.click_button 'AddOutcome'
    page.fill_in 'MatterType', with: values[:matter_type]
    matter_type = page.find_by_id('MatterType')
    matter_type.send_keys :tab
    # Schedule Reference
    page.find_by_id('LinesDFF3', wait: 5)
    page.fill_in 'LinesDFF3', with: values[:submission_reference]
    # Case ref number
    page.fill_in 'LinesDFF4', with: values[:case_ref_number]
    # Case Start Date	
    page.fill_in 'LinesDFF5', with: values[:case_start_date]
    # Case ID
    page.fill_in 'LinesDFF6', with: values[:case_id]
    # Procurement Area
    page.fill_in 'LinesDFF7', with: values[:procurement_area]
    procurement_area = page.find_by_id('LinesDFF7')
    procurement_area.send_keys :tab
    sleep(2)
    # Access Point
    page.fill_in 'LinesDFF8', with: values[:access_point]
    # Client Forename
    page.fill_in 'LinesDFF10', with: values[:client_forename]
    # Client Surname
    page.fill_in 'LinesDFF11', with: values[:client_surname]
    # Client DOB
    page.fill_in 'LinesDFF12', with: values[:client_dob]
    # UCN
    sleep(2) #TODO find better way than sleep
    page.fill_in 'LinesDFF13', with: values[:ucn]
    # Postal application accepted
    page.select values[:postal_application_accepted], from: 'LinesDFF14'
    # Gender
    page.select values[:gender], from: 'LinesDFF15'
    # Ethnicity
    page.select values[:ethnicity], from: 'LinesDFF16'
    # Disability
    page.select values[:disability], from: 'LinesDFF17'
    # Postcode
    page.fill_in 'LinesDFF18', with: values[:postcode]
    # Case concluded date
    page.fill_in 'LinesDFF19', with: values[:case_concluded_date]
    # Advice time
    page.fill_in 'LinesDFF20', with: values[:advice_time]
    # Travel time
    page.fill_in 'LinesDFF21', with: values[:travel_time]
    # Waiting Time
    page.fill_in 'LinesDFF22', with: values[:waiting_time]
    # Profit costs excluding VAT
    page.fill_in 'LinesDFF23', with: values[:profit_costs_excluding_vat]
    # Disbursements excluding VAT
    page.fill_in 'LinesDFF24', with: values[:disbursements_excluding_vat]
    # Counsel costs excluding VAT
    page.fill_in 'LinesDFF25', with: values[:counsel_costs_excluding_vat]
    # Disbursements VAT amount
    page.fill_in 'LinesDFF26', with: values[:disbursements_vat_amount]
    # Profit and Counsel VAT Indicator
    page.select values[:profit_and_counsel_vat_indicator], from: 'LinesDFF27'
    # London Rate
    page.select values[:london_rate], from: 'LinesDFF28'
    # Travel and Waiting costs excluding VAT
    page.fill_in 'LinesDFF29', with: values[:travel_and_waiting_costs_excluding_vat]
    # Value of Costs/Damages awarded
    page.fill_in 'LinesDFF30', with: values[:value_of_costs_damages_awarded]
    # Local authority number
    page.fill_in 'LinesDFF31', with: values[:local_authority_number]
    # Client Type
    page.select values[:client_type], from: 'LinesDFF32'
    # Stage Reached
    # Outcome for client
    page.select values[:outcome_for_client], from: 'LinesDFF34'
    # Case stage level
    page.select values[:case_stage_level], from: 'LinesDFF35'
    # Exemption Criteria Satisfied
    page.select values[:exemption_criteria_satisfied], from: 'LinesDFF36'
    # Exceptional case funding Ref
    # Transfer date
    page.click_button 'Apply_uixr'
  end

  def delete_all_outcomes
    steps %(
      Given a test firm user is on the portal login page
      When user Logs in
      Then Portal application page is displayed
      When user clicks on CWA link
      Then CWA application page is displayed
      When user navigates to Submissions page
      Then Submission Search Page displayed
      When user searches for their legal help submission
      Then their submission details are displayed
    )
    page.click_link 'Select All'
    page.click_button 'Delete'
    page.click_button 'Yes'
  end
end
