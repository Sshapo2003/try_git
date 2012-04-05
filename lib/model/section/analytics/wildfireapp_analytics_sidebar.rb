class Model::Section::Analytics::WildfireappAnalyticsSidebar < SitePrism::Section
  element :overview_link, "ol li a[href='#{Helpers::Config['wildfire_analytics_root']}']"
  element :industry_benchmarks_link, 'ol li a[href*=\'industry_benchmarks\']'
  element :tabs_link, 'ol li a[href*=\'tabs_report\']'
  element :pages_link, 'ol li a[href*=\'pages_report\']'
  element :posts_link, 'ol li a[href*=\'posts_report\']'
  element :referral_sources_link, 'ol li a[href*=\'referral_sources\']'
end
