class Model::Section::Sidebar::AccountSettingsPanel < SitePrism::Section
  element :back_button, 'button.back.panel-changer'
  
  ['Basic Info', 'Members', 'Billing'].each do |link|
    element link.downcase.parameterize('_').to_sym, "a:contains('#{link}')"
  end
  
  def active?
    !!(root_element['class'] =~ /active/)
  end
end