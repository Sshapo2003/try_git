class Model::Section::Messenger::Uitk5WildfireappMessengerComposeMessagePanel < Model::Section::Messenger::WildfireappMessengerComposeMessagePanel
  element :send_button, "input[name='commit']"
  element :later_button, '.later input'
  element :recepients_error, '#recipients .inline_error'

end
