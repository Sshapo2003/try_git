class Helpers::SauceSetup
  def self.require_sauce
    require 'sauce'
    require 'sauce/capybara'
    require './ext/driver'
  end

  def self.configure_sauce
    require_sauce
    Sauce.config do |config|
      config.username = "nathanbain"
      config.access_key = "2e0be596-090b-4c0e-aadf-144d6751879a"
      config.os = sauce_os
      config.browser = sauce_browser
      config.version = sauce_browser_version
      config["max-duration"] = 300 # The maximum duration per test
      config["command-timeout"] = 60 # The maximum duration of a single command
      config["idle-timeout"] = 60 # The maximum duration the browser should sit idle
    end
  end

  def self.using_sauce_labs?
    ENV['SAUCE'] == 'true'
  end

  def self.sauce_config_set?
    !ENV['SAUCESETUP'].nil?
  end

  def self.sauce_os
    ENV['SAUCE_OS'].nil? ? :XP : ENV['SAUCE_OS']
  end

  def self.sauce_browser
    ENV['SAUCE_BROWSER'].nil? ? "firefox" : ENV['SAUCE_BROWSER']
  end

  def self.sauce_browser_version
    ENV['SAUCE_BROWSER_VERSION']
  end
end
