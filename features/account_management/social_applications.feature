@account_management @amtest
Feature: Social Applications
  In order to post messages from apps other than the default
  As a Wildfire App user
  I want to be able to store my Facebook application credentials in Account Management
  
  Background:
    Given I'm logged in to google as a wildfireapp.com domain user

  @complete
  Scenario: Add a Facebook application to Wildfire
    Given I am logged in to Wildfire as a new user
    And my subscription allows me to add Facebook applications
    When I add the Facebook application "My Funky App" to Wildfire
    Then I should see the message "You've successfully added your custom application."
    And "My Funky App" should appear in my custom applications
    
  @not-started
  Scenario: Messenger is listed as the default Facebook application
  
  @not-started
  Scenario: Remove a Facebook application
  
  @not-started
  Scenario: Add a page to a custom Facebook application
  
  @not-started
  Scenario: Remove a page from a Facebook application
  
  @not-started
  Scenario: Remove a page from Your Properties that has also been added to a Facebook application