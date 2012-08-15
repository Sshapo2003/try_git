class Model::Page::Uitk5WildfireappAnalytics < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_analytics_root']}"
  set_url_matcher /dashboard./

  section :sidebar, Model::Section::Analytics::Uitk5WildfireappAnalyticsSidebar, '#dashboard_nav'
  section :content_div, Model::Section::Analytics::Uitk5WildfireappAnalyticsContentDiv, '.outer'
  
  def active?
    using_wait_time(1) { page.has_no_content?('This product is locked') }
  end
end
