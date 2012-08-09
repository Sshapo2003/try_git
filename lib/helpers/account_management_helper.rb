class Helpers::AccountManagementHelper
  class << self
    def register_and_login_new_user
      # Workaround for Rally DE1278 - some apps error if we hit the signup page directly, so
      # ensure we follow the signup link from the login page
      wildfire.login.load
      wildfire.login.signup_link.click
      
      signup = wildfire.signup
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
    
    def valid_user_credentials
      {
        :first_name => 'Firstname',
        :last_name =>  'Lastname',
        :company_name => 'Company Name',
        :email => "#{String.random}my@email.com",
        :password => 'pa55w0rd'
      }
    end
  end
end