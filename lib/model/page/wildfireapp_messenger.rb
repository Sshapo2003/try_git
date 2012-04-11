class Model::Page::WildfireappMessenger < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_messenger_root']}/"

  section :sidebar, Model::Section::Messenger::WildfireappMessengerSidebar, 'div.sidebar'
  section :messages_div, Model::Section::Messenger::WildfireappMessengerMessageDiv, 'div#incoming_messages'

  def is_loaded?
    page.current_url.include? 'messenger'
  end
  
  def active?
    using_wait_time(1) { page.has_no_content?('This product is locked') }
  end
end
