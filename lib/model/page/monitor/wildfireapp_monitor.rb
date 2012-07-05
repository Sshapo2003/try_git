class Model::Page::Monitor::WildfireappMonitor < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_monitor_root']}/"
  set_url_matcher /monitor/
  
  def active?
    using_wait_time(1) { page.has_no_content?('This product is locked') }
  end
end
