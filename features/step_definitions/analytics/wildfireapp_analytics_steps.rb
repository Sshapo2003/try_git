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
    @wildfire.wildfireapp_analytics.content_div.wait_for_promotions_panel(30)
    @wildfire.wildfireapp_analytics.content_div.should have_promotions_panel
  when "Audience" 
    @wildfire.wildfireapp_analytics.content_div.wait_for_audience_panel(30)
    @wildfire.wildfireapp_analytics.content_div.should have_audience_panel
  when "Industry Benchmarks" 
    @wildfire.wildfireapp_analytics.content_div.wait_for_industry_benchmarks_panel(30)
    @wildfire.wildfireapp_analytics.content_div.should have_industry_benchmarks_panel
  when "Tabs"
    @wildfire.wildfireapp_analytics.content_div.wait_for_tabs_panel(30)
    @wildfire.wildfireapp_analytics.content_div.should have_tabs_panel
  when "Pages" 
    @wildfire.wildfireapp_analytics.content_div.wait_for_pages_panel(30)
    @wildfire.wildfireapp_analytics.content_div.should have_pages_panel
  when "Posts" 
    @wildfire.wildfireapp_analytics.content_div.wait_for_posts_panel(30)
    @wildfire.wildfireapp_analytics.content_div.should have_posts_panel
  when "Referral Sources"
    @wildfire.wildfireapp_analytics.content_div.wait_for_referral_sources_panel(30)
    @wildfire.wildfireapp_analytics.content_div.should have_referral_sources_panel
  else raise "Unknown panel #{panel}"
  end
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
