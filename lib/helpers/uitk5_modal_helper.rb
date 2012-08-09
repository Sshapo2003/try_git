module Helpers
  module Uitk5ModalHelper
    def has_modal?
      begin
        first('div.modal') ? true : false
      rescue Selenium::WebDriver::Error::StaleElementReferenceError => e
        retry
      end
    end
    
    def within_modal
      wait_until() { has_modal? }
      within_frame(find('div.modal iframe')[:id]) { yield }
    end
  end
end