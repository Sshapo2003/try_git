require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'yaml'
require 'erb'

namespace :cuke do
  template = File.open(File.join(Dir.pwd, 'cucumber.yml')) {|f| f.read}
  profiles = YAML::load(ERB.new(template).result).keys
  profiles.each do |profile|
    Cucumber::Rake::Task.new(profile.to_sym) do |t|
      t.profile = profile
      t.libs << 'lib'
    end
  end
end

namespace :config do
  desc "List available configs"
  task :list do
   config_yaml = File.join(Dir.pwd, 'config.yml')
    raise "the config yaml file could not be found" unless File.exists?(config_yaml)
    config_yaml_file = YAML::load(File.open(config_yaml))
    puts "Known configurations are are:"
    config_yaml_file.keys.each do |key|
      puts "  - #{key}"
    end
  end
end

namespace :sauce do
  require 'active_support/deprecation'
  require 'active_support/dependencies'
  ActiveSupport::Dependencies.autoload_paths << File.expand_path(File.join(Dir.pwd, 'lib'))

  cuke_task = ENV["TAGS"] ? "cuke:custom" : "cuke:complete"

  desc "Run cucumber features in SauceLabs - all supported ie versions"
  task :ie do
    Helpers::SauceHelper.runtask(Helpers::SauceHelper.ie_configurations, cuke_task)
  end

  desc "Run cucumber features in SauceLabs - all supported ff versions"
  task :firefox do
    Helpers::SauceHelper.runtask(Helpers::SauceHelper.firefox_configurations, cuke_task)
  end

  desc "Run cucumber features in SauceLabs - all supported chrome versions"
  task :chrome do
    Helpers::SauceHelper.runtask(Helpers::SauceHelper.chrome_configurations, cuke_task)
  end
end

task :default => [:doco]

task :doco do |t|
  message = <<-MESSAGE
Optional flags:
  CONFIG=am-test,staging, live (default)
  BROWSER=firefox (default),chrome
  SAUCE=true
    SAUCE_OS=LINUX,XP,VISTA
    SAUCE_BROWSER=firefox,chrome,ie
    SAUCE_BROWSER_VERSION=a number
  MESSAGE
  puts message
end
