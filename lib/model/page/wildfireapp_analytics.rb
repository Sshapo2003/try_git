class Model::Page::WildfireappAnalytics < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_analytics_root']}"
  set_url_matcher /dashboard./

  section :sidebar, Model::Section::Analytics::WildfireappAnalyticsSidebar, '#dashboard_nav'
  section :content_div, Model::Section::Analytics::WildfireappAnalyticsContentDiv, '.outer'
  
  def active?
    using_wait_time(1) { page.has_no_content?('This product is locked') }
  end
  
  def pages_report
    Model::Page::Analytics::PagesReport.new
  end
  
  def referral_sources
    Model::Page::Analytics::ReferralSources.new
  end
end
