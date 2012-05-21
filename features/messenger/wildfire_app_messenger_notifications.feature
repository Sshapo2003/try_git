@messenger @production @staging @amtest
Feature: Notifications

Background:
    Given I am logged in as "default"

  @complete
  Scenario: Notification Count is Incremented
    Given I have no current notifications
    When a notification event is triggered
    Then I should have notifications
    