module Helpers
  # Certain links in Wildfire don't work when clicked using Capybara's 'click' method in Firefox.
  # This is a workaround. Hopefully we'll be able to remove this after the UI Toolkit upgrade is
  # completed.
  module FirefoxLinksHelper
    def click_wf_link(locator)
      link = find_link(locator)
      Capybara.current_driver.to_s.include?('firefox') ? link.native.send_key(:return) : link.click
    end
  end
end