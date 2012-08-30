Feature: Newly redesigned "Page Properties" panel within "Page Editor" page
 
Background:
	Given I am loged in to Page Manager
	And I go to My Template page
	And I create new page from existing template

	Scenario: Verify that user can see "Page properties" panel in "Page Editor" page
		When I am on "Page Editor" page
		Then I should see "Page properties" panel

	Scenario: Verify that "Back to Pages" button on the left side of the topbar brings user back to the pages listing
		When I click "Back to Pages" button
		Then I am redirected to the pages listing

	Scenario: Verify that user can switch Preview to "Facebook Tab" channel 
		When I select  view on "Facebook tab" channel
		Then I see preview in "Facebook Tab" channel

	Scenario: Verify that user can switch Preview to "Facebook Canvas" channel 
		When I select  view on "Facebook Canvas" channel
		Then I see preview in "Facebook Canvas" channel

	Scenario: Verify that user can switch Preview to "Microsite" channel 
		When I select  view on "Microsite" channel
		Then I see preview in "Microsite" channel

	Scenario: Verify that user can switch Preview to "Mobile" channel 
		When I select  view on "Mobile" channel
		Then I see preview in "Mobile" channel

	Scenario: Verify that "Page Properties" button enables\disables page properties panel
		When I click "Page Properties" button
		Then  I should not see page properties panel 
		When I click "Page Properties" button again
		Then I should see page properties panel


	Scenario: Verify that "Pages properties" panel is right aligned
		When I am on "Page Editor" page
		Then I see "Pages properties" panel is on the right side

	Scenario: Verify that "Pages properties" panel can be closed by clicking on the X
		When I click on X to close "Pages properties" panel 
		Then I should not see "Pages properties" panel 

	Scenario: Verify that all plugins are in alphabetical order 
		When "Pages properties" panel is enabled
		Then I should see all plugins in alphabetical order 

	Scenario: Verify that each plugin has an edit button 
		When "Pages properties" panel is enabled
		Then I should see "Edit" button for each plugin

	Scenario: Verify that each plugin brings user to the corresponding plugin admin page 
		When I click on plugins "Edit" page
		Then I should see plugin admin page

	Scenario: Verify that each plugin brings user to the corresponding plugin admin page 
		When I click on plugins "Edit" page
		Then I should see plugin admin page

	Scenario: Verify that hovering mouse over plugin, highlights that plugin in the preview
		When I hover mouse pointer over certain plugin
		Then I should see that plugin highlighting in the preview 



