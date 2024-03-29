require_relative './submission_config/base'
require_relative './submission_config/errors'
require_relative './submission_config/constants'
require_relative './submission_config/categories_of_law'
require_relative './submission_config/config_builder'
require_relative './submission_config/models'

module SubmissionConfig
  def self.by_category_of_law(name)
    case name.downcase.to_sym
    when :discrimination
      CategoriesOfLaw::Discrimination.new
    when :education
      CategoriesOfLaw::Education.new
    when :asylum
      CategoriesOfLaw::Asylum.new
    when :immigration
      CategoriesOfLaw::Immigration.new
    else
      raise Errors::InvalidConfigError.new("'#{name}' is not a valid category of law")
    end
  end
end
