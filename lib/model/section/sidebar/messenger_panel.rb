class Model::Section::Sidebar::MessengerPanel < SitePrism::Section
  element :back_button, 'button.back.panel-changer'
  
  ['Messages', 'Flagged', 'Assigned', 'Deleted', 'Drafts', 'Scheduled', 'Sent', 'Filters', 'Targeting Presets', 'CSV Export'].each do |link|
    element link.downcase.parameterize('_').to_sym, "a:contains('#{link}')"
  end
  
  def active?
    !!(root_element['class'] =~ /active/)
  end
end