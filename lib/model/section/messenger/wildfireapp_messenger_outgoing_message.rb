class Model::Section::Messenger::WildfireappMessengerOutgoingMessage < SitePrism::Section
  element :body, 'div.message_body'
  element :delete_draft_link, 'div.actions a.delete'
  element :edit_draft_link, 'div.actions a.edit'
  element :pagination_current_page_indicator_text, 'div.pagination span.range'

  def delete_first_draft
    page.execute_script "$('div.recipient_avatar').first().mouseover()"
    sleep 2 # Wait for 'delete' button to become visible
    delete_draft_link.click
    sleep 2 # Wait for 'Are you sure?' dialog to become visible
    page.driver.browser.switch_to.alert.accept
  end

  def edit_first_draft
    message_body = body.text
    visit edit_draft_link[:href]
    message_body
  end
end
