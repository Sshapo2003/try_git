class Model::Section::PageManager::EditTemplate::ScreenShotForm  < SitePrism::Section
  element :add_image_button, "input[value='Add Image']"
  root_elements :images, '.screenshot img'
  root_element :form_in_active_state, '#wizard_screenshot_section.in'

  def is_visible?
    has_form_in_active_state?
  end

  def set_template_image image
    root_element.attach_file('page_template_screenshot_screenshot', File.join(Dir.pwd, 'fixtures/images', image))
    save
  end

  def save
    add_image_button.click
    wait_for_ajax(30)
  end

  def has_screenshot?
    images.count > 0
  end
end
