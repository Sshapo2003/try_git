@messenger @production
Feature: Assigned Messages

Background:
    Given I am logged in as "default"
    And I navigate to the wildfire app messenger page
    And I click the "Assigned Messages" tab on the left navigation menu on wildfire app messenger page

  @complete
  Scenario: Assigned message bubbletip on mouseover
    Given I have an assigned message
    When I hover over the assigned user icon
    Then then the assigned user bubbletip should be displayed

  # This is currently broken so will be implememted when fixed.
  @not_started
  Scenario: Unassign a message
    Given I have an assigned message
    When I unassign that message from myself
    Then the message should be not be displayed in my Assigned Messages
    