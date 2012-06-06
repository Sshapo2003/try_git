class Helpers::MessengerHelper
  class << self
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

  end
end
