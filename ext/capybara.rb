module Capybara
  class Session
    def accept_alert
      wait_until() { has_js_alert? }
      driver.browser.switch_to.alert.accept
    end
    
    def has_js_alert?
      begin
        driver.browser.switch_to.alert
        true
      rescue ::Selenium::WebDriver::Error::NoAlertPresentError => e
        return false
      end
    end
  end
  
  module Node
    class Element < Base
      #Returns the full css locator used to fine this element
      def css_locator
        temp_locator = locator
        temp_parent = parent
        while temp_parent.class == Capybara::Node::Element
          temp_locator = temp_parent.locator + " " + temp_locator
          temp_parent = temp_parent.parent
        end
        temp_locator
      end

      def locator
        @selector.locator
      end

      def parent
        @parent
      end
    end
  end
  
  class Selenium::Driver
    def within_frame(frame_id)
      old_window = browser.window_handle
      browser.switch_to.frame(frame_id)
      yield
    ensure
      browser.switch_to.window old_window
    end
  end
end
