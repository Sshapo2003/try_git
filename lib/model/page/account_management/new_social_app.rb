class Model::Page::AccountManagement::NewSocialApp < SitePrism::Page
  element :remote_id_field, '#fb_app_remote_id'
  element :secret_field,    '#fb_app_secret'
  element :cancel_button,   '.btn_cancel'
  element :save_button,     '.btn_save'
end