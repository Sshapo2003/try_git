@messenger
Feature: Messages

  Background:
    Given I am logged in as "default"
    And I navigate to the wildfire app messenger page
    
  @wip
  Scenario: Assign a message
    Given I have an unassigned message
    When I assign that message to myself
    Then the message should be in my Assigned Messages
