@messenger @production @staging @amtest
Feature: Messages

  Background:
    Given I am logged in to Wildfire as the default user
    And I navigate to the wildfire app messenger page
    
  @complete
  Scenario: Assign a message
    Given I have an unassigned message
    When I assign that message to myself
    Then the message should be in my Assigned Messages

  @complete @slow
  Scenario: Messages Panel Paging
    Given I have more than 25 messages in the Messages Panel
    Then 25 messages should be displayed in the Messages Panel
    And the Messages Panel paging message should include "1-25"
    And the left paging icon should be disabled in the Messages Panel
    And the right paging icon should be enabled in the Messages Panel
    When I click the right paging icon in the Messages Panel
    Then more messages should be displayed in the Messages Panel
    And the Messages Panel paging message should include "26-"
    And the left paging icon should be enabled in the Messages Panel
    When I go to the last page of messages in the Messages Panel
    Then the right paging icon should be disabled in the Messages Panel
    And the left paging icon should be enabled in the Messages Panel

  @complete @failing
  Scenario: Messages Panel Paging via URL
    Given I have more than 500 messages in the Messages Panel
    When I navigate to the last page of of messages in the Messages Panel via the URL
    Then the remaining messages should be displayed
