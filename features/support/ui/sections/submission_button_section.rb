class SubmissionButtonSection < SitePrism::Section
    set_default_search_arguments '#PageButtons'

    element :outcome_pricing_details_button, 'button[id="PricingDetails"]'
    element :printable_page_button, 'button[id="Print"]'
    element :export_button, 'button[id="Export"]'
    element :save_button, 'button[id="Save"]'
    element :submit_button, 'button[id="Submit"]'
end