class Model::Page::Monitor::Comparison < SitePrism::Page
  set_url_matcher /comparisons/

  elements :facebook_comparison_item_names, '#facebook_chart_comparison_4008_container .comparison_item .name'
  element :facebook_comparison_chart,       '#facebook_chart_comparison_4008'
  element :facebook_comparison_table,       '#facebook_chart_comparison_4008_container .comparison_table'

  elements :twitter_comparison_item_names,  '#facebook_chart_comparison_4009_container .comparison_item .name'
  element :twitter_comparison_chart,        '#facebook_chart_comparison_4009'
  element :twitter_comparison_table,        '#facebook_chart_comparison_4009_container .comparison_table'

end
