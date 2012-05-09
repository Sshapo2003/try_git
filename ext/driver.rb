require 'selenium-webdriver'

# This monkeypatch exists because SauceLabs takes a screenshot after each command is executed and also on each reset call.
# The screenshot on reset is quite useful for test failure diagnosis.
# The reset method for capybara calls @browser.navigate.to('about:blank') and as a result we get blank screen in SauceLabs
# instead of the final page view.
# This patch simply comments out the @browser.navigate.to('about:blank') so SauceLabs will capture the final screen of each test.

# capybra/lib/selenium/driver.rb
class Capybara::Selenium::Driver < Capybara::Driver::Base
  def reset!
    # Use instance variable directly so we avoid starting the browser just to reset the session
    if @browser
      begin
        @browser.manage.delete_all_cookies
      rescue Selenium::WebDriver::Error::UnhandledError
        # delete_all_cookies fails when we've previously gone
        # to about:blank, so we rescue this error and do nothing
        # instead.
      end
      #@browser.navigate.to('about:blank')
    end
  end


# Convenience method to easily open a new instance of a selenium browser
  def new_browser
    @browser = Selenium::WebDriver.for(options[:browser], options.reject { |key,val| SPECIAL_OPTIONS.include?(key) })

    main = Process.pid
  end

  def refresh
    browser.navigate.refresh
  end
end
