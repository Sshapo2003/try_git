class Model::Section::Messenger::WildfireappMessengerMessage < SitePrism::Section
  element :assigned_to, 'div.assigned_to'
  element :flagged, 'div.flagged_message_icon'
  element :input, 'input'
  element :date_time, 'div.posted_at'
  element :body, 'div.body'

  def is_assigned?
    has_assigned_to?
  end

  def is_flagged?
    has_flagged?
  end

  def select
    input.click
  end
end
