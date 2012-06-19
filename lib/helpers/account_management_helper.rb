class Helpers::AccountManagementHelper
  class << self
    def register_and_login_new_user
      # Workaround for Rally DE1278 - some apps error if we hit the signup page directly, so first
      # visit the main front page to ensure we get cookies dropped
      wildfire.front_page.load
      wildfire.front_page.signup_link.click rescue nil # because the link isn't present on staging
      
      signup = wildfire.signup
      signup.load
      signup.signup_register_user_form.complete_form_with_valid_credentials
      signup.signup_register_user_form.accept_terms
      signup.signup_register_user_form.submit_registration
    end
    
    def login_account(email, password)
      wildfire.login.load
      wildfire.login.login(email, password)
    end
    
    def wildfire
      @wildfire ||= Model::Wildfire.new
    end
  end
end
