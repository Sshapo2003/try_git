class Model::Page::AccountManagement::SocialApps < SitePrism::Page
  include Helpers::ModalHelper
  
  element :new_company_button, '#button_new_company_social_app'
  
  def facebook_apps
    all('a.social_app').map { |a| a.text }
  end
  
  def add_application(remote_id, secret)
    new_company_button.click
    within_modal do
      new_social_app_form.remote_id_field.set(remote_id)
      new_social_app_form.secret_field.set(secret)
      new_social_app_form.save_button.click
    end
    wait_until() { !has_modal? }
  end
  
  def new_social_app_form
    @new_social_app ||= Model::Page::AccountManagement::NewSocialApp.new
  end
end