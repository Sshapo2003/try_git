class Model::Section::Sidebar::PromotionsPanel < SitePrism::Section
  element :back_button, 'button.back.panel-changer'
  
  ['Manage Campaigns', 'Custom Designs', 'Custom Streams', 'White Label Applications'].each do |link|
    element link.downcase.parameterize('_').to_sym, "a:contains('#{link}')"
  end
  
  def active?
    !!(root_element['class'] =~ /active/)
  end
end