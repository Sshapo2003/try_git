@account_management
Feature: Your Properties
	In order to allow Wildfire to manage my social properties
	As a Wildfire app user
	I want to be able to view and add properties I own to Wildfire

	@complete
	Scenario: View details of existing social properties already added to Wildfire
		Given I am logged in to Wildfire as a user with existing properties
		When I view "Your Properties" in Account Management
		Then I should see the following social properties:
		 | Name       | Type            |
		 | Alistairwf | Twitter Account |
		 | MyTestPage | Facebook Page   |

	@wip
	Scenario: Add a new Facebook property to Wildfire
		Given I am logged in to Wildfire as a new user
		When I add the Facebook page "MyFooPage" to Wildfire
		Then I should see Facebook page "MyFooPage" in Your Properties
	
	@complete
	Scenario: Add a new Twitter property to Wildfire
		Given I am logged in to Wildfire as a new user
		When I add the twitter account "alistairwf" to Wildfire
		Then I should see Twitter account "Alistairwf" in Your Properties
		
	@not-started
	Scenario: Reconnect a Facebook property with expired or broken connection
	
	@not-started
	Scenario: Reconnect a Twitter property with expired or broken connection
	
	@not-started
	Scenario: Action required message is displayed when there is an expired or broken Facebook property
	
	@not-started
	Scenario: Remove an existing Facebook property
	
	@not-started
	Scenario: Remove an existing Twitter property
	
		