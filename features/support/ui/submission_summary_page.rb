require_relative 'sections/submission_button_section.rb'
require_relative 'sections/submission_header_section.rb'
require_relative 'sections/submission_summary_section.rb'

# class SubmissionSummaryNmsCivilSection < SitePrism::Section
#     set_default_search_arguments '#NewMatterStartsTableCivil'
    
#     elements :category, 'span[title="Category"]'
#     elements :schedule_reference, 'span[title="Schedule Reference"]'
#     elements :access_point, 'span[title="Access Point"]'
#     elements :procurement_area, 'span[title="Procurement Area"]'
#     elements :delivery_location, :xpath, @@table_base + './/td[5]'
#     elements :matter_starts, :xpath, @@table_base + './/td[6]'
#     elements :recalculate_button, :xpath, @@table_base + './/td[7]'
#     elements :matter_starts_total, :xpath, @@table_base + './/td[8]'
# end

# class SubmissionSummaryNmsCrimeSection < SitePrism::Section
#     set_default_search_arguments '#NewMatterStartsTableCrime'

#     elements :stage_reached, :xpath, @@table_base + './/td[1]'
#     elements :description, :xpath, @@table_base + './/td[2]'
#     elements :controlled_work_reported_this_month, :xpath, @@table_base + './/td[3]'
#     elements :total_value_work_reported_this_month, :xpath, @@table_base + './/td[4]'
# end

class SubmissionSummaryPage < SitePrism::Page
    section :button_section, SubmissionButtonSection
    section :header_section, SubmissionHeaderSection
    section :summary_section, SubmissionSummarySection
    
    # section :nms_civil, SubmissionSummaryNmsCivilSection
    # section :nms_crime, SubmissionSummaryNmsCrimeSection

    element :back_button, :xpath, '//*[@id="PageButtons"]/tbody/tr[1]/td[10]/button'
end