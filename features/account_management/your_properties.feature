@account_management
Feature: Your Properties
  In order to allow Wildfire to manage my social properties
  As a Wildfire app user
  I want to be able to view and add properties I own to Wildfire

  @complete @staging
  Scenario: View details of existing social properties already added to Wildfire
    Given I am logged in to Wildfire as a user with existing properties
    When I view "Your Properties" in Account Management
    Then I should see the following social properties:
     | Name       | Type            |
     | alistairwf | Twitter Account |
     | MyTestPage | Facebook Page   |

  @not-started
  Scenario: Owned properties display in Messenger
  
  @not-started
  Scenario: Tracked properties do not display in Messenger
  
  @not-started
  Scenario: Owned properties display in Analytics
  
  @not-started
  Scenario: Tracked properties display in Analytics
  
  @complete @staging @amtest @no-chrome
  Scenario: Add a new Twitter property to Wildfire
    Given I am logged in to Wildfire as a new user
    When I add the twitter account "alistairwf3" to Wildfire
    Then I should see Twitter account "alistairwf3" in Your Properties
    
  @complete @staging @amtest @no-chrome
  Scenario: Prevent the same Twitter property from being added multiple times
    Given I am logged in to Wildfire as a new user
    And I have added the twitter account "alistairwf3" to Wildfire
    When I add the twitter account "alistairwf3" to Wildfire
    Then I should see the message "The Twitter account you are trying to add has already been added."
  
  @not-started
  Scenario: Reconnect a Twitter property with expired or broken connection
    
  @complete @amtest @staging
  Scenario: Remove an existing Twitter property
    Given I am logged in to Wildfire as a new user
    And I have added the twitter account "alistairwf3" to Wildfire
    When I remove the twitter account "alistairwf3" from Wildfire
    Then I should have 0 social properties
    And I should see the alert "Twitter property has been removed from Wildfire." on the Your Properties page
