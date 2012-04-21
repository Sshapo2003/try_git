class Model::Page::WildfireappAnalytics < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_analytics_root']}/"
  set_url_matcher /dashboard.wildfireapp.com/

  section :sidebar, Model::Section::Analytics::WildfireappAnalyticsSidebar, 'div.sidebar'
  section :content_div, Model::Section::Analytics::WildfireappAnalyticsContentDiv, 'div.body_content'
  
  def active?
    using_wait_time(1) { page.has_no_content?('This product is locked') }
  end
end
