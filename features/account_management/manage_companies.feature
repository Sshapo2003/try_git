@account_management
Feature: Manage Companies
  In order to keep my social properties organised
  As a Wildfire user
  I want to be able to create and manage multiple companies under my account
  
  Background:
    Given I'm logged in to google as a wildfireapp.com domain user
    And I am logged in to Wildfire as a new user
  
  @complete @amtest
  Scenario: Delete a Company
    Given my subscription allows multiple Companies
    And I am using the default company for the account
    And I have created a second Company in my account
    When I delete the second Company
    Then I should see the message "Company deleted"
    And I should be using the first Company
    And the second company should not appear in the Company selector menu
  
  @complete @amtest
  Scenario: Prevent deleting the only company on the account
    When I delete the current company
    Then I should see the message "You may not remove the only company associated with this account"
    
  @complete @amtest @staging
  Scenario: Create a new Company
    Given my subscription allows multiple Companies
    When I create a new Company under the current account
    Then I should be using the new Company
    
  @complete @amtest @staging
  Scenario: Display validation message if the Company name is not unique
    Given my subscription allows multiple Companies
    When I attempt to create a new company using the current company name
    Then I should see the message "Name has already been taken" inside the create company modal
  
  @complete @amtest @staging
  Scenario: Create a new company under a new Account
    When I create a new Company under a new Account
    Then I should be using the new Company
    And the new Account should be created
    
  @complete @amtest
  Scenario Outline: Switch active Company
    Given my subscription allows multiple Companies
    And I have created a second Company in my account
    And I am in the "<application>" application
    When I switch to the first Company
    Then I should be using the first Company
  
  Examples:
    | application       |
    | Messenger         |
    | Analytics         |
    | Page Manager      |
    | Promotion Builder |
#   | Monitor           | needs updating for UITK5
