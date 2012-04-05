class Model::Page::WildfireappAnalytics < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_messenger_root']}/"

  section :sidebar, Model::Section::Analytics::Messenger::WildfireappAnalyticsSidebar, 'div.sidebar'
  section :content_div, Model::Section::Analytics::Messenger::WildfireappMessengerMessageDiv, 'div.body_content'

  def is_loaded?
    page.current_url.include? 'dashboard'
  end
end
