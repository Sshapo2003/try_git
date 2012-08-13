class Model::Section::PageManager::EditTemplate::ContentForm  < SitePrism::Section
  element :template_name, '#page_template_title'
  element :template_description, '#page_template_description'
  element :content_save_and_continue_button, '.btn-primary'

  def set_template_name name
    template_name.set name
    save
  end

  def set_template_description description
    template_description.set description
    save
  end

  def save
    content_save_and_continue_button.click
    wait_for_ajax
  end
end
