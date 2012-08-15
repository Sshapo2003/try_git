class Model::Page::Monitor::WildfireappMonitor < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_monitor_root']}/"
  set_url_matcher /monitor/

  elements :comparison_links, '.span12 > div > a'
  
  def active?
    using_wait_time(1) { page.has_no_content?('This product is locked') }
  end

  def facebook_comparisson_link
    comparison_links[1]
  end

  def twitter_comparisson_link
    comparison_links[2]
  end
end
