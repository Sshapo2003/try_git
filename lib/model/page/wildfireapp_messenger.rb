class Model::Page::WildfireappMessenger < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_messenger_root']}/"

  section :sidebar, Model::Section::WildfireAppMessengerSidebar, 'div.sidebar'
  section :messages_div, Model::Section::WildfireappMessengerMessageDiv, 'div#incoming_messages'

  def is_loaded?
    page.current_url.include? 'messenger'
  end
end
