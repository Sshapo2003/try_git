class Model::Section::AccountManagement::SocialApp < SitePrism::Section
  include Helpers::Uitk5ModalHelper
  
  element :name_link,                 'a.social_app'
  element :actions_button,            "a:contains('Actions')"
  element :add_pages_option,          "a:contains('Add Pages')"
  element :edit_application_option,   "a:contains('Edit Application')"
  element :remove_application_option, "a:contains('Remove Application')"
  
  def name
    name_link.text
  end
  
  def remove
    actions_button.click
    remove_application_option.click
    page.accept_alert
  end
  
  def add_page(page_name)
    actions_button.click
    add_pages_option.click
    within_modal do
      find("tr:contains('Page')", :text => page_name).first("input[type='checkbox']").set(true)
      click_on("Add to Application")
    end
  end
  
  # Can't retrieve pages for an app directly as they are not listed withing the root element('tr')
  # containing the app
  #
  # def pages
  # end
end