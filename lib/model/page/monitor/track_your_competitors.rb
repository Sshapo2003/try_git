class Model::Page::Monitor::TrackYourCompetitors < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_monitor_root']}/"
  set_url_matcher /monitor/
  
  element :facebook_comparisson_text_field_one, '#comparison_facebook_items_attributes_0_name'
  elements :comparisson_drop_down_selections, '.ui-autocomplete li'
end
