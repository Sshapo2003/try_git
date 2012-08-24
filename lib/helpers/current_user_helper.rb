module Helpers::CurrentUserHelper
  class User    
    def able_to_create_referral_sources?
      wildfire.analytics.referral_sources.load
      wildfire.analytics.referral_sources.create_new_referral_source_button.click
      wildfire.analytics.referral_sources.has_modal? && !wildfire.analytics.referral_sources.has_tooltip?
    end
    
    def able_to_manage_published_pages?
      wildfire.account_management.sidebar.load_application(:pages)
      published_page = wildfire.page_manager.published_pages_panel.pages.first
      published_page.has_edit_link? && !published_page.has_view_link?
    end
    
    def able_to_manage_templates?
      wildfire.account_management.sidebar.load_application(:pages)
      wildfire.page_manager.sidebar_links.map { |l| l.text }.include? "Upload a Template"
    end
    
    def able_to_use_public_templates?
      wildfire.account_management.sidebar.load_application(:pages)
      wildfire.page_manager.sidebar_links.map { |l| l.text }.include? "Template Gallery"
    end
    
    def able_to_post_messages?
      wildfire.account_management.your_properties.load
      property_name = wildfire.account_management.your_properties.social_properties.first
      wildfire.account_management.sidebar.load_application(:messages)
      wildfire.wildfireapp_messenger.click_tab('Compose')
      wildfire.wildfireapp_messenger.compose_and_send_a_valid_message(property_name)
      !wildfire.wildfireapp_messenger.compose_message_panel.has_permission_denied_popover?
    end
    
    def able_to_post_comments?
      wildfire.account_management.sidebar.load_application(:messages)
      message = wildfire.wildfireapp_messenger.incoming_messages_panel.messages.first
      message.add_comment("That's really funny LOL")
      !message.has_permission_denied_popover?
    end
    
    def able_to_delete_messages?
      wildfire.account_management.sidebar.load_application(:messages)
      panel = wildfire.wildfireapp_messenger.incoming_messages_panel
      message = panel.messages.first
      return false if panel.delete_button[:class].match /disabled/
      message.select
      panel.delete_button.click
      Capybara.current_session.accept_alert
      !!wildfire.wildfireapp_messenger.sticky_header_text.text.match(/Message was successfully deleted/)
    end
    
    def able_to_manage_applications?
      social_apps = wildfire.account_management.social_apps
      social_apps.load
      !social_apps.has_permission_denied_alert? && social_apps.has_new_app_button?
    end
    
    def able_to_manage_social_properties?
      wildfire.account_management.your_properties.load
      !wildfire.account_management.your_properties.disabled?
    end
    
    def able_to_manage_services?
      wildfire.account_management.services.load
      !wildfire.account_management.services.has_permission_denied_alert?
    end
    
    def able_to_manage_locations?
      wildfire.account_management.locations.load
      !wildfire.account_management.locations.disabled?
    end
    
    def able_to_manage_company_information?
      wildfire.account_management.basic_info.load
      !wildfire.account_management.basic_info.disabled?
    end
    
    def able_to_manage_published_promotions?
      wildfire.promotions.manage_campaigns.load
      wildfire.promotions.manage_campaigns.campaigns.first.edit
      !wildfire.promotions.manage_campaigns.has_permission_denied_alert?
    end
    
    def able_to_delete_promotions?
      wildfire.promotions.manage_campaigns.load
      wildfire.promotions.manage_campaigns.create_campaign(:name => String.random) #create a campaign to be deleted
      wildfire.promotions.manage_campaigns.load
      wildfire.promotions.manage_campaigns.campaigns.last.delete
      wildfire.promotions.manage_campaigns.has_delete_success_alert? && !wildfire.promotions.manage_campaigns.has_permission_denied_alert?
    end
    
    def able_to_export_leads?
      wildfire.promotions.manage_campaigns.load
      wildfire.promotions.manage_campaigns.campaigns.first.manage_leads
      wildfire.promotions.entries.export_button.click
      wildfire.promotions.export.loaded?
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