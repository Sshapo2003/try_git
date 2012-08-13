class Model::Section::PageManager::EditTemplate::AppearanceForm  < SitePrism::Section
  root_element :form_in_active_state, '#wizard_appearance_section.in'

  def is_visible?
    has_form_in_active_state?
  end
end
