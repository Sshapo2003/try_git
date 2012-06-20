@account_management @amtest
Feature: Social Applications
  In order to post messages from apps other than the default
  As a Wildfire App user
  I want to be able to store my Facebook application credentials in Account Management
  
  Background:
    Given I'm logged in to google as a wildfireapp.com domain user
    And I am logged in to Wildfire as a new user
    And my subscription allows me to add Facebook applications

  @complete
  Scenario: Add a Facebook application to Wildfire
    When I add the Facebook application "My Funky App" to Wildfire
    Then I should see the message "You've successfully added your custom application."
    And "My Funky App" should appear in my custom applications
    
  @complete
  Scenario: Messenger is listed as the default Facebook application
    Then "Messenger" should appear in my custom applications

  @complete
  Scenario: Invalid Facebook application credentials are rejected
    When I add try to add an invalid application to my custom applications
    Then the Add Application modal should display the error message
    """
    Could not validate Application credentials. Please check your Application ID and Secret Key
    """
  
  @complete
  Scenario: Remove a Facebook application
    Given I have added the Facebook application "My Funky App" to my custom applications
    When I remove "My Funky App" from my custom applications
    Then I should see the message "Application has been successfully removed."
    And "My Funky App" should not appear in my custom applications
  
  @complete @firefox_facebook_profile
  Scenario: Add a page to a custom Facebook application
    Given I am logged in to Facebook as a page administrator
    And I have added the Facebook page "Wildfire Test Automation" to Your Properties
    And I have added the Facebook application "My Funky App" to my custom applications
    
    When I add the page "Wildfire Test Automation" to the application "My Funky App"
    Then I should see the message "Facebook page information has been updated"
    And "Wildfire Test Automation" should be listed under "My Funky App" in applications
  
  @complete @firefox_facebook_profile
  Scenario: Remove a page from a Facebook application
    Given I am logged in to Facebook as a page administrator
    And I have added the Facebook page "Wildfire Test Automation" to Your Properties
    And I have added the Facebook application "My Funky App" to my custom applications
    And I have added the page "Wildfire Test Automation" to the application "My Funky App"
  
    When I remove the "Widlfire Test Automation" page from the app "My Funky App"
    Then I should see the message "Facebook property has been removed from your custom application."
    And "Wildfire Test Automation" should not be listed under "My Funky App" in applications
    But I should see Facebook page "Wildfire Test Automation" in Your Properties
  
  
  @complete @firefox_facebook_profile
  Scenario: Remove a page from Your Properties that has also been added to a Facebook application
    Given I am logged in to Facebook as a page administrator
    And I have added the Facebook page "Wildfire Test Automation" to Your Properties
    And I have added the Facebook application "My Funky App" to my custom applications
    And I have added the page "Wildfire Test Automation" to the application "My Funky App"
    
    When I remove the Facebook page "Wildfire Test Automation" from Your Properties
    Then "Wildfire Test Automation" should not be listed under "My Funky App" in applications