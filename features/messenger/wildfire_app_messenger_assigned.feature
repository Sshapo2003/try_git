@messenger @production
Feature: Assigned Messages

Background:
    Given I am logged in as "default"
    And I navigate to the wildfire app messenger page
    And I view the "Assigned" tab

  @not_started
  Scenario: Unassign a message
    Given I have an assigned message
    When I unassign that message from myself
    Then the message should be not be displayed in my Assigned Messages
    