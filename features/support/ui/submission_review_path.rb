require_relative 'sections/submission_button_section.rb'
require_relative 'sections/submission_header_section.rb'
require_relative 'sections/submission_summary_section.rb'

class SubmissionReviewPage < SitePrism::Page
    section :header_section, SubmissionHeaderSection
    section :button_section, SubmissionButtonSection
    section :summary_section, SubmissionSummarySection

    element :next_button, :xpath, '//*[@id="PageButtons"]/tbody/tr[1]/td[12]/button'
    element :back_button, :xpath, '//*[@id="PageButtons"]/tbody/tr[1]/td[8]/button'
end