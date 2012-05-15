class Model::Section::Messenger::WildfireappMessengerOutgoingMessage < SitePrism::Section
  element :body, 'div.message_body'
  element :delete_draft_link, 'div.actions a.delete'
  element :edit_draft_link, 'div.actions a.edit'
  element :pagination_current_page_indicator_text, 'div.pagination span.range'

  def delete_first_draft
    page.execute_script '$("div.actions a.delete").first().click()'
    sleep 2
    page.driver.browser.switch_to.alert.accept
  end

  def edit_first_draft
    message_body = body.text
    visit edit_draft_link[:href]
    message_body
  end
end
