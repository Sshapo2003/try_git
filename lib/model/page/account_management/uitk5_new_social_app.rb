class Model::Page::AccountManagement::Uitk5NewSocialApp < SitePrism::Page
  include Helpers::Uitk5ModalHelper
  
  element :remote_id_field, '#fb_app_remote_id'
  element :secret_field,    '#fb_app_secret'
  element :cancel_button,   "input[value='close']"
  element :save_button,     '.btn-primary'
  
  def add_application(remote_id, secret)
    within_modal do
      remote_id_field.set(remote_id)
      secret_field.set(secret)
      save_button.click
    end
  end
  
  def errors
    within_modal() { all('.help-inline').map { |e| e.text } }
  end
  
  def has_errors?
    !errors.empty?
  end
end