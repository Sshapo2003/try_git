@account_management @amtest @staging @firefox_facebook_profile
Feature: Your Properties
  In order to allow Wildfire to manage my social properties
  As a Wildfire app user
  I want to be able to view and add Facebook properties I own to Wildfire
  
  Background:
    Given I am logged in to Facebook as a page administrator
    And I am logged in to Wildfire as a new user
  
  @complete
  Scenario: Add a new Facebook property to Wildfire
    When I add the Facebook page "Wildfire Test Automation" to Wildfire
    Then I should see Facebook page "Wildfire Test Automation" in Your Properties
    
  @complete
  Scenario: Remove an existing Facebook property
    Given I have added the Facebook page "Wildfire Test Automation" to Wildfire
    When I remove the Facebook page "Wildfire Test Automation" from Your Properties
    Then I should have 0 social properties
    And I should see the message "Facebook property has been removed from Wildfire."
    
  @not-started
  Scenario: Reconnect a Facebook property with expired or broken connection
  
  @not-started
  Scenario: Action required message is displayed when there is an expired or broken Facebook property