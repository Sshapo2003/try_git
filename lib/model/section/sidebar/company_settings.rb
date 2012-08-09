class Model::Section::Sidebar::CompanySettings < SitePrism::Section
  element :back_button, 'button.back.panel-changer'
  
  ['Your Properties', 'Tracked Properties', 'Applications', 'Teams', 'Basic Info', 'Locations', 'Services'].each do |link|
    element link.downcase.parameterize('_').to_sym, "a:contains('#{link}')"
  end
  
  def active?
    !!(root_element['class'] =~ /active/)
  end
end