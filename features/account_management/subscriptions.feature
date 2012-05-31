@account_management @amtest @staging
Feature: Subscriptions
  In order to generate $$$s for Wildfire
  As a Wildfire App user
  I should be limited according to my active subscription(s)
  
  @complete
  Scenario: New account is given a default subscription
    Given I am logged in to Wildfire as a new user
    Then I should have the default subscription
  
  @complete @no-chrome
  Scenario: Limit feature tags from multiple subscriptions are summed
    Given I am logged in to Wildfire as a new user
    When I am given the following additional subscription:
      | Twitter Property Limit | 1 |
    Then I should not be able to add more than 2 Twitter Properties
    And I should see the Twitter Properties limit exceeded message