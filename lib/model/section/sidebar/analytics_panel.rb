class Model::Section::Sidebar::AnalyticsPanel < SitePrism::Section
  element :back_button, 'button.back.panel-changer'
  
  ['Industry Benchmarks', 'Tabs', 'Pages', 'Posts', 'Referral Sources', 'Posts', 'Referral Sources', 'Getting Started'].each do |link|
    element link.downcase.parameterize('_').to_sym, "a:contains('#{link}')"
  end
  
  def active?
    !!(root_element['class'] =~ /active/)
  end
end