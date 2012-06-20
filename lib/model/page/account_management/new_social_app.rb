class Model::Page::AccountManagement::NewSocialApp < SitePrism::Page
  include Helpers::ModalHelper
  
  element :remote_id_field, '#fb_app_remote_id'
  element :secret_field,    '#fb_app_secret'
  element :cancel_button,   '.btn_cancel'
  element :save_button,     '.btn_save'
  
  def add_application(remote_id, secret)
    within_modal do
      remote_id_field.set(remote_id)
      secret_field.set(secret)
      save_button.click
    end
  end
  
  def errors
    within_modal() { all('div.warning').map { |e| e.text } }
  end
  
  def has_errors?
    !errors.empty?
  end
end