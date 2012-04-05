Given /^I navigate to the (.*) page$/ do |page_name|
  @wildfire = Model::Wildfire.new
  @messengeradmin = Model::Messengeradmin.new
  @facebook = Model::Facebook.new
  case page_name
  when 'login'
    visit "#{Helpers::Config['wildfire_site_root']}/logout" unless @wildfire.login.is_loaded?
    @wildfire.login.load
    raise "This is not the login page. URL: #{current_url}" unless @wildfire.login.is_loaded?
  when 'signup' then @wildfire.signup.load
  when 'wildfire app messenger' 
    @wildfire.wildfireapp_messenger.load
    @wildfire.wildfireapp_messenger.is_loaded?.should be_true
  when 'wildfire app analytics'
    @wildfire.wildfireapp_analytics.load
    @wildfire.wildfireapp_analytics.is_loaded?.should be_true
  when 'wildfire app page manager'
    @wildfire.wildfireapp_page_manager.load
    @wildfire.wildfireapp_page_manager.is_loaded?.should be_true
  when 'messenger admin login' then @messengeradmin.login.load
  when 'messenger admin dashboard' then @messengeradmin.dashboard.load
  when 'palo alto foodies countdown app'
    visit('http://www.facebook.com/PaloAltoFoodies/app_364041783617057')
  else raise "Haven't mapped the '#{page_name}' page"
  end
end