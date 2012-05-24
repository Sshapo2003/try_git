@messenger @production @staging @amtest
Feature: Notifications

Background:
    Given I am logged in as "default"

  @complete
  Scenario: Displaying of Notifications
    Given I have no current notifications
    When a notification event is triggered
    Then I should have notifications
    When I click the notifications link
    Then I should see the recently triggered notification details
    And I should have no current notifications
    