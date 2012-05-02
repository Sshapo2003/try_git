class Model::Section::Messenger::WildfireappMessengerSidebar < SitePrism::Section
  element :compose_link, 'li.compose a span:first-child'
  element :messages_link, 'li.inbox a span:first-child'
  element :flagged_messages_link, 'li.flagged a span:first-child'
  element :assigned_messages_link, 'li.assigned a span:first-child'
  element :deleted_messages_link, 'li.deleted a span:first-child'
end
