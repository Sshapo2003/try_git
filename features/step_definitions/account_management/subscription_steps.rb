When /^I am granted access to (Page Manager|Messenger|Dashboard)$/ do |application|
  @wildfire.account_management.demo_page.enable_application(application)
end