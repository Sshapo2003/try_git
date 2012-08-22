class Model::Page::WildfireappAnalytics < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_analytics_root']}"
  set_url_matcher /dashboard./

  section :sidebar, Model::Section::Analytics::WildfireappAnalyticsSidebar, '#dashboard_nav'
  section :content_div, Model::Section::Analytics::WildfireappAnalyticsContentDiv, '.outer'
  
  def active?
    using_wait_time(1) { page.has_no_content?('This product is locked') }
  end
end
