@messenger @production
Feature: Messages

  Background:
    Given I am logged in as "default"
    And I navigate to the wildfire app messenger page
    
  @complete
  Scenario: Assign a message
    Given I have an unassigned message
    When I assign that message to myself
    Then the message should be in my Assigned Messages

  @not_started
  Scenario: Messages Panel Paging
    Given I have more than 25 messages
    Then 25 messages should be displayed in the Drafts Panel
    And the Messages Panel paging message should include "1-25"
    And the right paging icon should be enabled in the Messages Panel
    When I click the right paging icon in the Messages Panel
    Then more messages should be displayed
    And the Messages Panel paging message should include "26-"
    And the left paging icon should be enabled in the Messages Panel
