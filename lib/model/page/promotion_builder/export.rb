class Model::Page::PromotionBuilder::Export < SitePrism::Page
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  
  element :generate_csv_button, '#generate_csv_link'
  element :cm_activate_sync_button, '#campaign-monitor-activate-sync'
  element :cc_activate_sync_button, '#constant-contact-activate-sync'
  
  def loaded?
    has_generate_csv_button? && has_cm_activate_sync_button? && has_cc_activate_sync_button?
  end
  alias :active? :loaded?
end