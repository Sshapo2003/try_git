class Helpers::AccountManagementHelper
  class << self
    def register_and_login_new_user
      # In future we may be able to do at least some of this through the API
      signup = Model::Wildfire.new.signup
      signup.load
      signup.signup_register_user_form.complete_form_with_valid_credentials
      signup.signup_register_user_form.accept_terms
      signup.signup_register_user_form.submit_registration
    end
  end
end
