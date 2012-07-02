class Model::Section::Messenger::MessageComment < SitePrism::Section
  element :body, '.body'
  element :like_button, 'a.like'
  element :like_message, 'span.like'
  element :delete_button, '.delete'

  def like
    like_button.click
    Timeout.timeout(30) {sleep 0.1 while not liked?}
  end

  def liked?
    like_message.text.include? 'You like this comment'
  end
end
