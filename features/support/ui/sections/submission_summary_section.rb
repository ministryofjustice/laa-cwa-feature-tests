class SubmissionSummarySection < SitePrism::Section
    set_default_search_arguments '#SummaryDetailsRN'
   
    element :outcomes, '#N3\:Numberofoutcomes\:0'
    element :total_reported_profit_costs, '#N3\:ProfitCosts\:0'
    element :total_reported_disbursement_costs, '#N3\:Disbursements\:0'
    element :total_reported_counsel_costs, '#N3\:CounselCosts\:0'
    element :total_reported_costs, '#N3\:Total\:0'
end