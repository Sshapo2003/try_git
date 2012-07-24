class Model::Page::Monitor::Comparison < SitePrism::Page
  set_url_matcher /comparisons/

  elements :facebook_comparison_item_names, '#facebook_chart_comparison_4008_container .comparison_item .name'
  element :facebook_comparison_chart, '#facebook_chart_comparison_4008'
  element :facebook_comparison_table, '#facebook_chart_comparison_4008_container .comparison_table'
end
