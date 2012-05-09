@account_management @amtest @staging
Feature: Account Features
  In order to generate $$$s for Wildfire
  As a Wildfire App User
  I should only have access to the account features that I have paid for
  
  @complete
  Scenario: Applications that are accessible to a new user
    Given I am logged in to Wildfire as a new user
    Then I should have access to Promotion Builder
    And I should have access to Monitor
    But I should not have access to Analytics
    And I should not have access to Page Manager
    And I should not have access to Messenger