class Helpers::Config
  include Singleton
  attr_reader :yaml_config
  attr_reader :config_yaml_file

  class << self
    attr_accessor :project_root
  end
  
  def initialize
    config_yaml = File.join(Dir.pwd, 'config.yml')
    raise "the config yaml file could not be found" unless File.exists?(config_yaml)
    @config_yaml_file = YAML::load(File.open(config_yaml))
    ENV['CONFIG'] = @config_yaml_file['defaults']['default_config'] if ENV['CONFIG'].nil?
    abort "There is no Config '#{ENV['CONFIG']}'! Please rerun using one of the following #{@config_yaml_file.keys}" if @config_yaml_file["#{ENV['CONFIG']}"].nil?
    @yaml_config = @config_yaml_file["#{ENV['CONFIG']}"]
  end
  
  def value_for(key_name)
    raise "there is no key '#{key_name}' for the config that you specified" if @yaml_config[key_name].nil?
    @yaml_config[key_name]
  end
  
  def self.[](key_name)
    instance.value_for(key_name)
  end

  def self.defaults
    instance.config_yaml_file['default']
  end

  #use when you need to get more than one level deep into the hash
  def values
    @yaml_config
  end

  def self.admin_login
    'testautomation'
  end

  def self.admin_password
    'th1sismypassword'
  end
end
