class Model::Page::WildfireappAnalytics < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_messenger_root']}/"

  section :sidebar, Model::Section::Analytics::WildfireappAnalyticsSidebar, 'div.sidebar'
  section :content_div, Model::Section::Analytics::WildfireappAnalyticsContentDiv, 'div.body_content'

  def is_loaded?
    page.current_url.include? 'dashboard'
  end
  
  def active?
    using_wait_time(1) { page.has_no_content?('This product is locked') }
  end
end
