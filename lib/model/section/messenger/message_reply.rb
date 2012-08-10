class Model::Section::Messenger::MessageReply < SitePrism::Section
  element :body,                            '.body'
  root_element :reply_form,                 '.reply_form'
  root_element :reply_text_entry_field,     '.reply_field'
  root_element :reply_button,               '.reply_link a'
  root_element :post_reply_button,          '.tweet_button'
  root_element :disabled_post_reply_button, '.tweet_button.disabled'
  root_element :char_count_down,            '.countdown'
end
