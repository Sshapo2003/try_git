@account_management @amtest
Feature: Account Features
  In order to generate $$$s for Wildfire
  As a Wildfire App User
  I should only have access to the account features that I have paid for
  
  @complete @staging
  Scenario: Applications that are accessible to a new user
    Given I am logged in to Wildfire as a new user
    Then I should have access to Promotion Builder
    And I should have access to Monitor
    But I should not have access to Analytics
    And I should not have access to Page Manager
    And I should not have access to Messenger
    
  @complete @amtest
  Scenario Outline: Enable access to applications
    Given I am logged in to Wildfire as a new user
    When I am granted access to <application>
    Then I should have access to <application>
  
  Examples:
    | application  |
    | Page Manager |
    | Messenger    |
    | Dashboard    |
    
  @complete @staging @production
  Scenario: Existing user can access all applications
    Given I am logged in to Wildfire as a user with access to all applications
    Then I should have access to the following applications:
      | Page Manager      |
      | Messenger         |
      | Dashboard         |
      | Promotion Builder |
      | Monitor           |
    
  @complete @staging
  Scenario: Invite user without advanced permissions enabled
    Given I am logged in to Wildfire as a new user
    Then I should not be able to set advanced permissions
    
  @complete @staging @failing
  Scenario: Invite users with advanced permissions enabled
    Given I am logged in to Wildfire as a new user
    And I have the advanced permissions feature enabled
    Then I should be able to set advanced permissions
    
