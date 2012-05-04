@account_management
Feature: Manage Companies
  In order to keep my social properties organised
  As a Wildfire user
  I want to be able to create and manage multiple companies under my account
  
  @not-started
  Scenario: Delete a Company
    # Given
    # When
    # Then I should be using the default company for the account
  
  @not-started
  Scenario: Flash message if user attempts to delete the only company on Account
  
  @complete @amtest @staging
  Scenario: Create a new Company
    Given I am logged in to Wildfire as a new user
    When I create a new Company under the current account
    Then I should be using the new Company
    
  @complete @amtest @staging
  Scenario: Display validation message if the Company name is not unique
    Given I am logged in to Wildfire as a new user
    When I attempt to create a new company using the current company name
    Then I should see the message "Name has already been taken" inside the create company modal
  
  @complete @amtest @staging
  Scenario: Create a new company under a new Account
    Given I am logged in to Wildfire as a new user
    When I create a new Company under a new Account
    Then I should be using the new Company
    And the new Account should be created
    
  @not-started
  Scenario: Switch active Company
    # Test in each application
  
  @not-started
  Scenario: Rename Account
  