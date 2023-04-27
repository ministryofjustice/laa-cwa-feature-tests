require_relative 'helpers/bulkload'
require_relative 'helpers/error'
require_relative 'helpers/page'
require_relative 'helpers/pricing'
require_relative 'helpers/submission_config'
require_relative 'helpers/submission'
require_relative 'helpers/testing'
require_relative 'helpers/xml_builder'

World(Helpers::Bulkload)
World(Helpers::Error)
World(Helpers::Page)
World(Helpers::Pricing)
World(Helpers::Submission)
World(Helpers::SubmissionConfig)
World(Helpers::Testing)
World(Helpers::XMLBuilder)