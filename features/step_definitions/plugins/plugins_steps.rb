When /^I create and save a template$/ do
  @wildfire.wildfireapp_page_manager.sidebar_links.select {|l| l.text.include? 'My Templates'}.first.click
  @wildfire.wildfireapp_page_manager.content_div.templetes_drop_down_menu.click
  @wildfire.wildfireapp_page_manager.content_div.click_templates_menu_create_blank_template_option
end

Then /^the the template should be listed in my templates$/ do
  pending # express the regexp above with the code you wish you had
end