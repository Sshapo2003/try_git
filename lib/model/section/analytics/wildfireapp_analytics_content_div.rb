class Model::Section::Analytics::WildfireappAnalyticsContentDiv < SitePrism::Section
  element :promotions_panel, 'div.promotions-panel'
  element :audience_panel, 'div.monitor-panel'
  element :industry_benchmarks_panel, 'div.industry_benchmarks'
  element :tabs_panel, 'div#tabs_report'
  element :pages_panel, 'div#pages_report'
  element :posts_panel, 'div#posts_report'
  element :referral_sources_panel, 'div.report'
  element :industry_benchmarks_sticky_text, 'div.post_it p'
  element :tabs_sticky_header_text, 'div.post_it h2'
  element :pages_sticky_header_text, 'div.post_it h2'
  element :posts_sticky_header_text, 'div.post_it h2'
end
