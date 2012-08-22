class Model::Section::Messenger::WildfireappMessengerSidebar < SitePrism::Section
  element :messages_link, 'a[href="/incoming_messages"]'
  element :flagged_messages_link, 'a[href="/flagged_messages"]'
  element :assigned_messages_link, 'a[href="/assigned_messages"]'
  element :deleted_messages_link, 'a[href="/deleted_messages"]'
  element :sent_messages_link, 'a[href="/sent_messages"]'
  element :drafts_link, 'a[href="/draft_messages"]'
  element :scheduled_link, 'a[href="/scheduled_messages"]'
  element :filters_link, 'a[href="/message_filters"]'
end
