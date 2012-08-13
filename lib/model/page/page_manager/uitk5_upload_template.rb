class Model::Page::PageManager::Uitk5UploadTemplate < SitePrism::Page
  element :template_name_textbox, 'input#page_template_title'
  element :accept_terms_checkbox, 'input#page_template_tos'
  element :upload_file_input, 'input#page_layout_version_zip_file'
  element :submit_button, ".btn-primary"
  root_element :upload_template_form, 'form#create_or_update_form'

  def upload_a_template(template_name='templates/test_template_for_upload.zip')
    upload_template_form.attach_file('page_layout_version_zip_file', File.join(Dir.pwd, 'fixtures', template_name))
  end
end
