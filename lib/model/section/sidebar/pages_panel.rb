class Model::Section::Sidebar::PagesPanel < SitePrism::Section
  element :back_button, 'button.back.panel-changer'
  
  ['Published', 'Drafts', 'Archived', 'Template Gallery', 'My Templates', 'Upload a Template', 'Documentation', 'Targeting'].each do |link|
    element link.downcase.parameterize('_').to_sym, "a:contains('#{link}')"
  end
  
  def active?
    !!(root_element['class'] =~ /active/)
  end
end