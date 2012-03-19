Given /^I navigate to the (.*) page$/ do |page_name|
  @wildfire = Model::Wildfire.new
  case page_name
  when 'login' then @wildfire.login.load
  when 'signup' then @wildfire.signup.load  
  else raise "Haven't mapped the '#{page_name}' page"
  end
end