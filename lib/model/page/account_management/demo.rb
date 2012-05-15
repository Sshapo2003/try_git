class Model::Page::AccountManagement::Demo < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_site_root']}/demo"
  set_url_matcher /\/demo/
  
  element :edit_account_link, "a:contains('Edit Account')"
  element :edit_account_modal_iframe, "iframe[src*='edit']"
  
  def enable_application(application)
    load if !displayed?
    edit_account_link.click
    within_frame(edit_account_modal_iframe[:id]) do
      check application
      click_on 'Save'
    end
  end
end