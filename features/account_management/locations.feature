@account_management
Feature: Locations
	In order for Wildfire to know locations my Company operates in
	As a Wildfire App user
	I want to be able to add company locations to Wildfire
	
	@complete @staging @amtest
	Scenario: Add a new company location
		Given I am logged in to Wildfire as a new user
		And I navigate to the Account Management page
		When I add a new company location
		Then the new location should be included in Company Locations
		
	@not-started
	Scenario: Remove an existing location
	
	@not-started
	Scenario: Add multiple locations
	
	@not-started
	Scenario: Edit an existing location
	
	@not-started
	Scenario: Display a validation message if Address 1 is not provided
	
	@not-started
	Scenario: Display a validation message if City is not provided
	
	@not-started
	Scenario: Display a validation message if Postal Code is not provided
	
	@not-started
	Scenario: Display a validation message if Country is not provided
	
	@not-started
	Scenario: Display a validation message if a state is selected for an invalid country
	
	@not-started
	Scenario: Display Company Name and Location on Campaigns published by this company
	