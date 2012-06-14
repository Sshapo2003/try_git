class Helpers::WildfireAccountsHelper
  class << self
    def get_credentials_for(user)
      load_users_for_current_config[user]
    end
    
    def load_users_for_current_config
      YAML.load(File.read('config/wildfire_users.yml'))[ENV['CONFIG']]
    end
  end
end