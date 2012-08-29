class Model::Page::Analytics::ReferralSources < SitePrism::Page
  include Helpers::ModalHelper
  
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  
  element :get_started_link, "a:contains('Get Started with Page Manager')"
  element :create_new_referral_source_button, '#create_referral_src_modal_lnk'
  element :tooltip, 'span.tooltip'
  
  def load
    return if loaded?
    sidebar.load_application(:analytics)
    sidebar.analytics_panel.referral_sources.click
    wait_until { loaded? }
  end
  
  def loaded?
    has_get_started_link? || has_create_new_referral_source_button?
  end
end