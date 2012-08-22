class Model::Section::Analytics::WildfireappAnalyticsContentDiv < SitePrism::Section
  element :inner_liner, '.main.container'
  element :pages_panel, '#pages_report_container'
  element :tabs_panel, '#page_manager_tab_report'
  element :posts_panel, '#posts_report_container'
  element :industry_benchmarks_panel, '.industry_benchmarks'
  element :referral_sources_panel, '#referral_sources'
  element :industry_benchmarks_sticky_text, '.flash_wpr'
  element :tabs_sticky_header_text, '.flash_wpr'
  element :pages_sticky_header_text, '.flash_wpr'
  element :posts_sticky_header_text, '.flash_wpr'
end
