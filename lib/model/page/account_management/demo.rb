class Model::Page::AccountManagement::Demo < SitePrism::Page
  include Helpers::ModalHelper
  
  set_url "#{Helpers::Config['wildfire_site_root']}/demo"
  set_url_matcher /\/demo/
  
  element :edit_account_link,         "a:contains('Edit Account')"
  element :edit_subscription_link,    "a:contains('Edit Subscription')"
  element :edit_account_modal_iframe, "iframe[src*='edit']"
  
  def show_edit_subscription_modal
    load if !displayed?
    edit_subscription_link.click
  end
end