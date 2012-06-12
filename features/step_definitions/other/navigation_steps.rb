Given /^I navigate to (the|my) (.*) page$/ do |unused, page_name|
  case page_name.downcase
  when 'login'
    @wildfire.login.load
    unless @wildfire.login.is_loaded? then
      visit "#{Helpers::Config['wildfire_site_root']}/logout"
      @wildfire.login.load
    end
  when 'signup' then @wildfire.signup.load
  when 'wildfire app messenger'
    @wildfire.wildfireapp_messenger.load
  when 'wildfire app analytics'
    @wildfire.wildfireapp_analytics.load
  when 'wildfire app page manager'
    @wildfire.wildfireapp_page_manager.load
  when 'wildfire app templates' then @wildfire.wildfireapp_templates.load
  when 'messenger admin dashboard' then @messengeradmin.dashboard.load
  when 'account management' then @wildfire.account_management.load
  else raise "Haven't mapped the '#{page_name}' page"
  end
end

Given /^I view the "(.*)" facebook page$/ do |page_name|
  @facebook.timeline.visit_timeline page_name
end

Given /^I am in the "([^"]*)" application$/ do |application|
  case application.downcase
  when 'messenger' then @wildfire.wildfireapp_messenger.load
  when 'analytics' then @wildfire.wildfireapp_analytics.load
  when 'page manager' then @wildfire.wildfireapp_page_manager.load
  else raise "not implemented for '#{application}'"
  end
end

When /^I view "([^"]*)" in Account Management$/ do |section|
  @wildfire.account_management.load
  @wildfire.account_management.sidebar.navigate_to(section)
end