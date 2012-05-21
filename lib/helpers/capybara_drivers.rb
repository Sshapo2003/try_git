class Helpers::CapybaraDrivers
  def self.register_all
    Capybara.register_driver :selenium_firefox do |app|
      profile = Selenium::WebDriver::Firefox::Profile.new
      profile["browser.cache.disk.enable"] = false
      profile["browser.cache.memory.enable"] = false
      profile.native_events = false
      Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
    end

    Capybara.register_driver :selenium_chrome do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    end
  end

  def self.browser
    case ENV['BROWSER']
    when "firefox" then :selenium_firefox
    when "chrome" then :selenium_chrome
    when "opera" then :selenium_opera
    else abort "BROWSER variable needs to be set to something valid, or left alone"
    end
  end

  def self.chosen_driver
    Helpers::SauceSetup.using_sauce_labs? ? :sauce : browser
  end
end

