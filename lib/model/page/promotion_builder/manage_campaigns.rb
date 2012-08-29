class Model::Page::PromotionBuilder::ManageCampaigns < SitePrism::Page
  include Helpers::ModalHelper
  
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  sections :campaigns, Model::Section::PromotionBuilder::Campaign, '#contests_table tbody tr'
  
  element :permission_denied_alert, ".alert-error:contains('You do not have the required permission')"
  element :delete_success_alert, ".alert-success:contains('was successfully deleted')"
  element :no_campaigns_image, "img[alt='Manage_campaigns_empty']"
  element :new_campaign_button, "a:contains('Create a Campaign')"
  
  def load
    return if loaded?
    sidebar.load_application(:promotions)
    sidebar.promotions_panel.manage_campaigns.click
    wait_until { loaded? }
  end
  
  def loaded?
    has_campaigns? || has_no_campaigns_image?
  end
  
  # This just does the minimum required to create a campaign in the list so that we can test
  # the delete campaigns permission
  def create_campaign(params)
    new_campaign_button.click
    within('.modal') { click_on('Signup Form') }
    fill_in('Campaign Name', :with => params[:name])
    click_on('Save & Continue')
  end
end