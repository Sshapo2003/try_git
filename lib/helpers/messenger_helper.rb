class Helpers::MessengerHelper
  class << self

    def comment_on_a_message message
      comment = String.random
      wildfire = Model::Wildfire.new

      unless message.has_comments? then message.view_comments_link.click end
      message.wait_for_comment_entry_field
      message.comment_entry_field.set comment
      message.add_comment_button.click
      msg = "Timeout occured waiting for comment '#{comment}' to appear."
      Timeout.timeout(30, msg) {sleep 0.1 while message.comments.select {|m| m.body.text.include? comment}.count == 0}

      comment
    end

    def wait_for_message_to_appear message
      wildfire = Model::Wildfire.new
      panel_has_message = lambda { wildfire.wildfireapp_messenger.messages_panel.messages.select { |m| m.body.text.include? message }.count > 0 }
      msg = "Timed out waiting for message to appear in messenger panel. Message body = #{message}"
      Timeout.timeout_and_raise(180, msg) do
        while panel_has_message.call == false
          sleep 2
          wildfire.wildfireapp_messenger.page.driver.refresh
        end
      end
      wildfire.wildfireapp_messenger.messages_panel.messages.select { |m| m.body.text.include? message }.first
    end

    def replies_for_message message
      message.view_replies_link.click
      msg = "Timed out waiting for replies to be displayed for message '#{message}'"
      Timeout.timeout_and_raise(30, msg) { sleep 1 while not message.has_replies? }
      message.replies
    end
    
    def reconnect_property property_name
      wildfire = Model::Wildfire.new
      wildfire.wildfireapp_messenger.compose_message_panel.reconnect_property_link.click
      Helpers::SettingsHelper.reconnect_property property_name
      wildfire.wildfireapp_messenger.load
      wildfire.wildfireapp_messenger.click_tab 'Compose'
    end
  end
end
