require_relative './submission_config/base'
require_relative './submission_config/errors'
require_relative './submission_config/constants'
require_relative './submission_config/categories_of_law'
require_relative './submission_config/config_builder'
require_relative './submission_config/models'

module SubmissionConfig
  def self.by_category_of_law(name)
    case name.downcase.to_sym
    when :asylum
      CategoriesOfLaw::ImmigrationAndAsylum::Asylum.new
    when :immigration
      CategoriesOfLaw::ImmigrationAndAsylum::Immigration.new
    else
      raise Errors::InvalidConfigError.new("'#{name}' is not a valid category of law")
    end
  end
end
