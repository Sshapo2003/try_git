class Model::Section::Sidebar::ApplicationsPanel < SitePrism::Section
  element :back_button, 'button.back.panel-changer'
  element :menu_header, 'li.menu-header'
  
  def active?
    !!(root_element['class'] =~ /active/)
  end
  
  ['Analytics', 'Pages', 'Messages', 'Promotions', 'Monitor', 'Company Settings'].each do |app|
    element app.downcase.parameterize('_').to_sym, "a:contains('#{app}')"
  end
end