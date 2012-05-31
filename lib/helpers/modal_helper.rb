module Helpers
  module ModalHelper
    def within_modal
      wait_until() { has_modal? }
      within_frame(find('div.wf-modal-container iframe')[:id]) { yield }
    end
  
    def has_modal?
      begin
        first('div.wf-modal-container iframe', :visible => true) ? true : false
      rescue Selenium::WebDriver::Error::StaleElementReferenceError => e
        # Unfortunately capybara's finders are subject to a race condition if options are used,
        # as they first locate the element and then filter by the given options. If the element
        # is modified at the same time, the above exception is raised by Selenium.
        retry
      end
    end
    
    def in_modal?
      using_wait_time(3) do
        begin
          has_css?('div.wf-modal-container iframe', :visible => true)
        rescue Selenium::WebDriver::Error::StaleElementReferenceError => e
          # Unfortunately capybara's finders are subject to a race condition if options are used,
          # as they first locate the element and then filter by the given options. If the element
          # is modified at the same time, the above exception is raised by Selenium.
          retry
        end
      end
    end

    # Some pages (such as 'Edit Account') either load inside or outside of modals, depending on
    # where they are called from
    def within_modal_if_required
      if in_modal?
        within_modal { yield }
      else
        yield
      end
    end
  end
end