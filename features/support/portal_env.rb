require 'yaml'

module PortalEnv
  CONFIG = YAML.safe_load(File.read(File.join(File.dirname(__FILE__), 'portal_env.yml')))
                .fetch(ENV.fetch('TEST_ENV').downcase)

  class << self
    def url
      CONFIG['url']
    end

    def cwa_provider_user
      CONFIG['cwa_provider_user']
    end

    def cwa_provider_user_password
      CONFIG['cwa_provider_user_password']
    end
  end
end