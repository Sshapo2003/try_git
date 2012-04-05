When /^I click the "(.*)" tab on the left navigation menu on wildfire app analytics page$/ do |tab|
  case tab
  when "Overview" 
    @wildfire.wildfireapp_analytics.sidebar.overview_link.click
  when "Industry Benchmarks" 
    @wildfire.wildfireapp_analytics.sidebar.industry_benchmarks_link.click
  when "Tabs" 
    @wildfire.wildfireapp_analytics.sidebar.tabs_link.click
  when "Pages" 
    @wildfire.wildfireapp_analytics.sidebar.pages_link.click
  when "Posts" 
    @wildfire.wildfireapp_analytics.sidebar.posts_link.click
  when "Referral Sources" 
    @wildfire.wildfireapp_analytics.sidebar.referral_sources_link.click
  else raise "Unknown tab #{tab}"
  end
  sleep 2
end

Then /^the "(.*)" panel should be visible in the dashboard area$/ do |panel|
  case panel
  when "Promotions" 
    @wildfire.wildfireapp_analytics.content_div.promotions_panel.class.should eql Capybara::Node::Element
  when "Audience" 
    @wildfire.wildfireapp_analytics.content_div.audience_panel.class.should eql Capybara::Node::Element
  else raise "Unknown tab #{tab}"
  end
end
