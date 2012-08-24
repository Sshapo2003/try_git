@messenger
Feature: Notifications

  Background:
    Given I am logged in to Wildfire as the default user
    And I navigate to the wildfire app messenger page

  @failing @production @staging @amtest
  Scenario: Displaying of Notifications
    Given I have no current notifications
    When a notification event is triggered
    Then I should have notifications
    When I click the notifications link
    Then I should see the recently triggered notification details
    And I should have no current notifications

  @not_started
  Scenario: Trigger a failed sent message notification
    Given I have attempted to send a message
    When this message fails to deliver
    Then I should have a notification
    When I click on the notifications link
    Then I should see the notification details "A message failed to send"
  
  @not_started
  Scenario: Email notification of Flag keyword Filter
    Given I have created a flag filter
    When a message triggers the keyword filter
    Then all team members for that company should receive an email notification

  @not_started
  Scenario: Email notification of Delete keyword Filter 
    Given I've created a delete keyword filter
    When a message triggers the keyword filter
    Then all team members for that company should receive an email notification
 