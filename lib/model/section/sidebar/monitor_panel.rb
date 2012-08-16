class Model::Section::Sidebar::MonitorPanel < SitePrism::Section
  element :back_button, 'button.back.panel-changer'
  
  ['New Comparison', 'by Likes', 'by Checkins', 'by Followers', 'by Following', 'by Tweets'].each do |link|
    element link.downcase.parameterize('_').to_sym, "a:contains('#{link}')"
  end
  
  def active?
    !!(root_element['class'] =~ /active/)
  end
end