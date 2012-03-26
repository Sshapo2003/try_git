Given /^I navigate to the (.*) page$/ do |page_name|
  @wildfire = Model::Wildfire.new
  @messengeradmin = Model::Messengeradmin.new
  case page_name
  when 'login'
    @wildfire.login.load
    @wildfire.login.is_loaded?.should be_true
  when 'signup' then @wildfire.signup.load
  when 'wildfire app messenger' 
    @wildfire.wildfireapp_messenger.load
    @wildfire.wildfireapp_messenger.is_loaded?.should be_true
  when 'messenger admin login' then @messengeradmin.login.load
  when 'messenger admin dashboard' then @messengeradmin.dashboard.load
  else raise "Haven't mapped the '#{page_name}' page"
  end
end