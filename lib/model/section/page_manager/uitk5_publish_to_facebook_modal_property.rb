class Model::Section::PageManager::Uitk5PublishToFacebookModalProperty < SitePrism::Section
  element :name, 'span'
  element :label, 'label'
  element :checkbox, 'input'

  def check_checkbox
    wait_for_and_click_checkbox(30)
  end
end
