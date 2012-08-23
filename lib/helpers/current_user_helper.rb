module Helpers::CurrentUserHelper
  class User    
    def able_to_create_referral_source?
      wildfire.analytics.referral_sources.load
      wildfire.analytics.referral_sources.create_new_referral_source_button.click
      wildfire.analytics.referral_sources.has_modal? && !wildfire.analytics.referral_sources.has_tooltip?
    end
    
    private
    
    def wildfire
      @wildfire ||= Model::Wildfire.new
    end
  end
  
  def current_user
    @user ||= User.new
  end
end