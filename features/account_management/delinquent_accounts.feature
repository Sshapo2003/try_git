@account_management
Feature: Delinquent Accounts
	In order to prevent access to unauthorised features
	As an adminstrator
	I should be able to mark an account as delinquent
	
	@US5971 @complete
	Scenario: Display request for payment page when logging in to delinquent account
		Given I am logged in to Wildfire as a user with a delinquent account
		Then I should see the request for payment page
	
	@US5971 @complete
	Scenario: Applications should not be accessible to a delinquent account
		Given I am logged in to Wildfire as a user with a delinquent account
		Then I should not have access to Messenger
		And I should not have access to Analytics
		And I should not have access to Page Manager
		
	@US5971 @complete
	Scenario: Switching from delinquent to non-delinquent account
		Given I am logged in to Wildfire as a user with a delinquent account
		When I switch to a non-delinquent account
		Then I should have access to Messenger
		And I should have access to Analytics
		And I should have access to Page Manager
		
	@US5971 @complete
	Scenario: Applications should not be accessible to a delinquent account
		Given I am logged in to Wildfire as a user with a delinquent account
		Then I should not have access to Messenger
		And I should not have access to Analytics
		And I should not have access to Page Manager
	
	@US6291 @complete
	Scenario Outline: Flash message for delinquent accounts
		Given I am logged in to Wildfire as a user with a delinquent account
		When I view "<section>" in Account Management
		Then I should see the delinquent account flash message
		Examples:
		 | section            |
		 | Basic Info         |
		 | Locations          |
		 | Your Properties    |
		 | Tracked Properties |
		 | Applications       |
		 | Services           |
