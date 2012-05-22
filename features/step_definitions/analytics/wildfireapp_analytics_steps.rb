When /^I click the "(.*)" tab on the left navigation menu on wildfire app analytics page$/ do |tab|
  case tab
  when "Overview" 
    @wildfire.wildfireapp_analytics.sidebar.overview_link.click
  when "Industry Benchmarks" 
    @wildfire.wildfireapp_analytics.sidebar.link("Industry Benchmarks").click
  when "Tabs" 
    @wildfire.wildfireapp_analytics.sidebar.link("Tabs").click
  when "Pages" 
    @wildfire.wildfireapp_analytics.sidebar.link("Pages").click
  when "Posts" 
    @wildfire.wildfireapp_analytics.sidebar.link("Posts").click
  when "Referral Sources" 
    @wildfire.wildfireapp_analytics.sidebar.link("Referral Sources").click
  else raise "Unknown tab #{tab}"
  end
end

Then /^the "(.*)" tab should be highlighted$/ do |tab|
  case tab
  when "Overview" 
    @wildfire.wildfireapp_analytics.sidebar.selected_link_label.text.should eql "Overview"
  when "Industry Benchmarks" 
    @wildfire.wildfireapp_analytics.sidebar.selected_link_label.text.should eql "Industry Benchmarks"
  when "Tabs" 
    @wildfire.wildfireapp_analytics.sidebar.selected_link_label.text.should eql "Tabs"
  when "Pages" 
    @wildfire.wildfireapp_analytics.sidebar.selected_link_label.text.should eql "Pages"
  when "Posts" 
    @wildfire.wildfireapp_analytics.sidebar.selected_link_label.text.should eql "Posts"
  when "Referral Sources" 
    @wildfire.wildfireapp_analytics.sidebar.selected_link_label.text.should eql "Referral Sources"
  else raise "Unknown tab #{tab}"
  end
end

Then /^the "(.*)" panel should be visible in the main page area on wildfire app analytics page$/ do |panel|
  case panel
  when "Promotions"
    element = 'promotions_panel'
  when "Audience"
    element = 'audience_panel'
  when "Industry Benchmarks" 
    element = 'industry_benchmarks_panel'
  when "Tabs"
    element = 'tabs_panel'
  when "Pages"
    element = 'pages_panel'
  when "Posts" 
    element = 'posts_panel'
  when "Referral Sources"
    element = 'referral_sources_panel'
  else raise "Unknown panel #{panel}"
  end
  wait_for_method = "wait_for_#{element}"
  have_method = "have_#{element}"
  
  @wildfire.wildfireapp_analytics.content_div.send(wait_for_method)
  @wildfire.wildfireapp_analytics.content_div.should send(have_method)  
end

Then /^the "(.*)" sticky should be visible in the main page area on wildfire app analytics page$/ do |sticky|
  case sticky
  when "Industry Benchmarks"
  @wildfire.wildfireapp_analytics.content_div.industry_benchmarks_sticky_text.text.should include "The chart below describes the landscape of your Facebook Page's industry"
  when "Tabs"
  @wildfire.wildfireapp_analytics.content_div.tabs_sticky_header_text.text.should include "Welcome to the Tabs report!"
  when "Pages"
  @wildfire.wildfireapp_analytics.content_div.pages_sticky_header_text.text.should include "Welcome to the Pages report!"
  when "Posts"
  @wildfire.wildfireapp_analytics.content_div.posts_sticky_header_text.text.should include "Welcome to the Posts report!"
  else raise "Unknown sticky #{sticky}"
  end
end
