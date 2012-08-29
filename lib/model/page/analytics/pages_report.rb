class Model::Page::Analytics::PagesReport < SitePrism::Page
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  
  element :export_button, "a:contains('Export')"
  element :export_to_csv_link, "a:contains('Export to CSV')"
  element :add_property_link, "a:contains('Add a Facebook Page you own')"
  element :tooltip, 'span.tooltip'
  
  def load
    return if loaded?
    sidebar.load_application(:analytics)
    sidebar.analytics_panel.pages.click
    wait_until { loaded? }
  end
  
  def loaded?
    has_export_button? && export_button.visible? || has_add_property_link?
  end
  
  def export_to_csv
    export_button.click
    wait_until { has_export_to_csv_link? }
    export_to_csv_link.click
    debugger
    sleep 0
  end
end