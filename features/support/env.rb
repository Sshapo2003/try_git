require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'active_support/core_ext'
require 'active_support/deprecation'
require 'active_support/dependencies'
require 'timeout'
require 'time'
require 'json'
require 'ruby-debug'

#setting 'lib' to be the root of active support's autoloader
ActiveSupport::Dependencies.autoload_paths << File.expand_path(File.join(Dir.pwd, 'lib'))

#set the project root
Helpers::Config.project_root = Dir.pwd

#read in our extensions/monkeypatches/hacks
require './ext/ext'

#Set the config and browser envvars, either from user input or from defaults in config.yml
ENV['CONFIG'] = Helpers::Config['default_config'] if ENV['CONFIG'].nil?
ENV['BROWSER'] = Helpers::Config['default_browser'] if ENV['BROWSER'].nil?

#decide if we're using saucelabs for this run
Helpers::SauceSetup.configure_sauce if Helpers::SauceSetup.using_sauce_labs?

Capybara.configure do |config|
  config.run_server = false
  config.default_selector = :css
  config.default_wait_time = Helpers::Config['default_wait_time']
  config.default_driver = Helpers::CapybaraDrivers.chosen_driver
  config.app_host = 'https://account.wildfireapp.com'
end

Capybara.register_driver :selenium_firefox do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile["browser.cache.disk.enable"] = false
  profile["browser.cache.memory.enable"] = false
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
end

Capybara.register_driver :selenium_chrome do |app|
# To get chrome working with selenium on the mac, run 'brew install chromedriver'
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

def browser
  case ENV['BROWSER']
  when "firefox" then :selenium_firefox
  when "chrome" then :selenium_chrome
  else :selenium_firefox
  end
end

Capybara.default_driver = browser

World(Capybara)

Capybara.run_server = false
