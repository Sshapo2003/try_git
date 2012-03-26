class Model::Section::WildfireAppMessengerSidebar < SitePrism::Section
  element :messages_link, 'li.inbox a'
  element :flagged_messages_link, 'li.flagged a'
  element :assigned_messages_link, 'li.assigned a'
  element :deleted_messages_link, 'li.deleted a'
end
