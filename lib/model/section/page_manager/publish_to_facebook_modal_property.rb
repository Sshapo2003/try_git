class Model::Section::PageManager::PublishToFacebookModalProperty < SitePrism::Section
  element :name, 'label span'
  element :label, 'label span'
  element :checkbox, 'input'

  def check_checkbox
    wait_for_and_click_name
  end
end
