When /^I create and save a template$/ do
  @wildfire.wildfireapp_page_manager.sidebar_links.select {|l| l.text.include? 'My Templates'}.first.click
  @template_name = Helpers::PageManagerHelper.create_template
end

Then /^the the template should be listed in my templates$/ do
  pending # express the regexp above with the code you wish you had
end