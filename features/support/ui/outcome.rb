class Outcome

  attr_accessor :defaults

  def initialize

    @defaults = {
      :matter_type => "IMLB:IOUT",
      :claim_type => "Completed Matter Claim",
      :schedule_reference => "",
      :case_reference_number => "TestCaseRef",
      :procurement_area => "PA00136",
      :access_point => "AP00137",
      :client_forename => "Test",
      :client_surname => "Person",
      :client_date_of_birth => '01-Nov-2015',
      :ucn => '01112015/T/PERS',
      :postal_application_accepted => 'N',
      :gender => 'Male',
      :ethnicity => '00-Other',
      :disability => 'NCD-Not Considered Disabled',
      :client_postcode => 'SW1H 9AJ',
      :case_concluded_date => '01-Nov-2019',
      :advice_time => '0',
      :travel_time => '0',
      :waiting_time => '0',
      :profit_costs_excluding_vat => '100.00',
      :disbursements_excluding_vat => '0',
      :counsel_costs_excluding_vat => '0',
      :disbursements_vat_amount => '0',
      :profit_and_counsel_vat_indicator => 'No',
      :legacy_case => 'No',
      :ho_interview => '0',
      :ait_hearing_centre => '16-Other',
      :travel_and_waiting_costs_excluding_vat => '0',
      :adjourned_hearing_fee => '0',
      :detention_travel_and_waiting_costs_excluding_vat => '0',
      :jr_form_filling_costs_excluding_vat => '0',
      :cmrh_oral => '0',
      :cmrh_telephone => '0',
      :substantive_hearing => 'No',
      :stage_reached => '',
      :outcome_for_client => 'IX',
      :exemption_criteria_satisfied => '',
      :exceptional_case_funding_reference => '',
      :case_id => ''
    }

  end

end
