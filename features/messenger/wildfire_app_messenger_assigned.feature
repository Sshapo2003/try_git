@messenger @production @staging @amtest
Feature: Assigned Messages

Background:
    Given I am logged in to Wildfire as the default user
    And I navigate to the wildfire app messenger page
    And I click the "Assigned Messages" tab on the left navigation menu on wildfire app messenger page

  @complete
  Scenario: Assigned message state
    Given I have an assigned message
    When I hover over the assigned user icon
    Then the assigned icon is displayed
    And the assigned user bubbletip should be displayed

  @not_started
  Scenario: Unassign a message
    Given I have an assigned message
    When I unassign that message from myself
    Then the message should be not be displayed in my Assigned Messages
    