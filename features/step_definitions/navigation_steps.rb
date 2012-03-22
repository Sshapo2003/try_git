Given /^I navigate to the (.*) page$/ do |page_name|
  @wildfire = Model::Wildfire.new
  @messengeradmin = Model::Messengeradmin.new
  case page_name
  when 'login' then @wildfire.login.load
  when 'signup' then @wildfire.signup.load
  when 'messenger admin login' then @messengeradmin.login.load
  when 'messenger admin dashboard' then @messengeradmin.dashboard.load
  else raise "Haven't mapped the '#{page_name}' page"
  end
end