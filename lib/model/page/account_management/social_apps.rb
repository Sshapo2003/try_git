class Model::Page::AccountManagement::SocialApps < SitePrism::Page
  include Helpers::ModalHelper
  include Helpers::FirefoxLinksHelper
  element :new_company_button, '#button_new_company_social_app'
  
  def facebook_apps
    wait_until() { !all('a.social_app').empty? }
    all('a.social_app').map { |a| a.text }
  end
  
  def pages_for_fb_app(app_name)
    find('div.facebook_app', :text => app_name).all('div.page_token.integration').map do |property|
      property.first('a.page_token').text
    end
  end
  
  def add_application(remote_id, secret)
    show_add_application_modal
    new_social_app.add_application(remote_id, secret)
    wait_until() { !has_modal? }
  end
  
  def show_add_application_modal
    new_company_button.click
  end
  
  def new_social_app
    @new_social_app ||= Model::Page::AccountManagement::NewSocialApp.new
  end
  
  def add_fb_page_to_app(page_name, app_name)
    find("div.field", :text => app_name).click_on("Add Pages")
    within_modal do
      find("div.page", :text => page_name).first("input[type='checkbox']").set(true)
      click_on("Add to Application")
    end
    wait_until() { !has_modal? }
  end
  
  def remove_fb_page_from_app(page_name, app_name)
    find('div.facebook_app', :text => app_name).click_on('Remove')
    page.accept_alert
  end
  
  def remove_app(app_name)
    find("div.field", :text => app_name).first('a.wf_menu_button').click
    click_wf_link('Remove Application')
    page.accept_alert
  end
end