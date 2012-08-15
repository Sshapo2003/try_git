@account_management @amtest
Feature: Tracked Properties
  In order to ?
  As a Wildfire app user
  I want to be able to add details of properties I want to track
  
  @complete @amtest @staging
  Scenario: Add a Facebook page to Tracked Properties
    Given I am logged in to Wildfire as a new user
    When I add the Facebook page "www.facebook.com/arsenal" to Tracked Properties
    Then I should see the page "Arsenal" in Tracked Properties
  
  @complete @amtest @staging
  Scenario: Add a Twitter profile to Tracked Properties
    Given I am logged in to Wildfire as a new user
    When I add the Twitter profile "wildfireapp" to Tracked Properties
    Then I should see the Twitter profile "wildfireapp" in Tracked Properties
  
  @complete @amtest
  Scenario: Remove a tracked Facebook property
    Given I am logged in to Wildfire as a new user
    And I have a tracked Facebook property
    When I remove the tracked property
    Then I should see the message "Facebook property has been removed from Wildfire"
    And I should have no tracked properties
  
  @complete @amtest @staging
  Scenario: Remove a tracked Twitter property
    Given I am logged in to Wildfire as a new user
    And I have a tracked Twitter property
    When I remove the tracked property
    Then I should see the message "Twitter property has been removed from Wildfire"
    And I should have no tracked properties
    