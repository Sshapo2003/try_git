class Helpers::SauceHelper
  def self.ie_configurations
    {
      "winxpie7" => { :os_name => "XP", :browser_name => "IE7", :os_value => "XP", :browser_value => "iexplore", :browser_version_value => "7" },
      "winxpie8" => { :os_name => "XP", :browser_name => "IE8", :os_value => "XP", :browser_value => "iexplore", :browser_version_value => "8" },
      "win7ie9" => { :os_name => "WIN7", :browser_name => "IE9", :os_value => "VISTA", :browser_value => "iexplore", :browser_version_value => "9" }
    }
  end

  def self.firefox_configurations
    {
      "winxpff3.5" => { :os_name => "XP", :browser_name => "FF3.5", :os_value => "XP", :browser_value => "firefox", :browser_version_value => "3.5" },
      "winxpff3.6" => { :os_name => "XP", :browser_name => "FF3.6", :os_value => "XP", :browser_value => "firefox", :browser_version_value => "3.6" },
      "winxpff4" => { :os_name => "XP", :browser_name => "FF4", :os_value => "XP", :browser_value => "firefox", :browser_version_value => "4" },
      "winxpff5" => { :os_name => "XP", :browser_name => "FF5", :os_value => "XP", :browser_value => "firefox", :browser_version_value => "5" },
      "winxpff6" => { :os_name => "XP", :browser_name => "FF6", :os_value => "XP", :browser_value => "firefox", :browser_version_value => "6" },
      "winxpff7" => { :os_name => "XP", :browser_name => "FF7", :os_value => "XP", :browser_value => "firefox", :browser_version_value => "7" },
      "winxpff8" => { :os_name => "XP", :browser_name => "FF8", :os_value => "XP", :browser_value => "firefox", :browser_version_value => "8" },
      "winxpff9" => { :os_name => "XP", :browser_name => "FF9", :os_value => "XP", :browser_value => "firefox", :browser_version_value => "9" }
    }
  end

  def self.chrome_configurations
    {
      "first" => { :os_name => "XP", :browser_name => "Chrome", :os_value => "XP", :browser_value => "chrome" },
      "second" => { :os_name => "WIN7", :browser_name => "Chrome", :os_value => "VISTA", :browser_value => "chrome" }
    }
  end

  def self.runtask(configs, cuke_task)
    configs.each { |key,value| puts sh %{ xterm -T "#{value[:os_name]} - #{value[:browser_name]}" -e "rake #{cuke_task} SAUCE=true SAUCE_OS=#{value[:os_value]} SAUCE_BROWSER=#{value[:browser_value]} SAUCE_BROWSER_VERSION=#{value[:browser_version_value]} ; read -p 'Press enter to close window'"& }}
  end
end
