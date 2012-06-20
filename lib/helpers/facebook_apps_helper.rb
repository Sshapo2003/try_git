class Helpers::FacebookAppsHelper
  class << self
    def get_credentials_for(application)
      facebook_app_credentials[application]
    end
    
    def facebook_app_credentials
      YAML.load(File.read(File.join 'config', 'fb_app_credentials.yml'))
    end
  end
end