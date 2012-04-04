@account_management
Feature: Basic Info
	In order to ?
	As a Wildfire App user
	I want to be able to provide basic info about my company
	
	Background:
		Given I am logged in to Wildfire as a new user
		And I view "Basic Info" in Account Management
	
	@complete
	Scenario: Update Company Name
		When I update my Company Name to "New Company"
		Then I should see the message "Company details updated"
		And the Company Name should be "New Company"

	@complete
	Scenario: Company Name cannot be blank
		When I update my Company Name to ""
		Then I should see the message "Company name can't be blank"
	
	@complete
	Scenario: Update Company Industry
		When I update my Company Industry to "Manufacturing"
		Then I should see the message "Company details updated"
		And the Company Industry should be "Manufacturing"
	
	@complete
	Scenario: Update Company Timezone
		When I update my Company Timezone to "(GMT+02:00) Helsinki"
		Then I should see the message "Company details updated"
		And the Company Timezone should be "(GMT+02:00) Helsinki"
	
	@complete
	Scenario: Update Company Website URL
		When I update my Company website URL to "http://nyan.cat"
		Then I should see the message "Company details updated"
		And the Company Website URL should be "http://nyan.cat"
		
	@not-started
	Scenario: Display error message if the Company Website URL is invalid
	
	@complete
	Scenario: Update Company Description
		When I update my Company Description to
		"""
		Wildfire is an easy-to-use yet powerful tool to grow, engage, and monetize your audience on
		Facebook, Twitter, YouTube and LinkedIn
		"""
		Then I should see the message "Company details updated"
		And the Company Description should be
		"""
		Wildfire is an easy-to-use yet powerful tool to grow, engage, and monetize your audience on
		Facebook, Twitter, YouTube and LinkedIn
		"""
		
	@complete
	Scenario: Update Company Email
		When I update my Company Email to "myemail@somecompany.com"
		Then I should see the message "Company details updated"
		And the Company Email should be "myemail@somecompany.com"
		
	@not-started
		Scenario: Display error message if the Company Email is invalid
		
	@complete
	Scenario: Update Reply Email
		When I update my Reply Email to "myemail@somecompany.com"
		Then I should see the message "Company details updated"
		And the Reply Email should be "myemail@somecompany.com"
	
	@not-started
	Scenario: Display error message when deleting the only active company
		When I attempt to delete the company
		Then I should see the message "You may not remove the only company associated with this account"
		
	@not-started
	Scenario: Delete Company
	
	@complete
	Scenario: Upload Company Logo
		When I upload a valid image as my company logo
		Then I should see the message "Company details updated"
		And I should no longer see the default logo image
	
	@complete	
	Scenario: Remove Company Logo
		Given I have uploaded a company logo
		When I remove the company logo
		Then I should see the message "Your logo has been successfully removed"
		And I should see the default logo image