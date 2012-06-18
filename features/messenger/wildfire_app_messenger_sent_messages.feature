@messenger @production @staging @amtest
Feature: Sent Messages

  Background:
    Given I am logged in to Wildfire as the default user
    And I navigate to the wildfire app messenger page
    And I click the "Sent" tab on the left navigation menu on wildfire app messenger page

  @complete
  Scenario: Sent Panel Paging
    Given I have more than 25 sent messages
    Then 25 messages should be displayed in the Sent Panel
    And the Sent Panel paging message should include "1-25"
    And the right paging icon should be enabled in the Sent Panel
    When I view the next page of sent messages
    Then more messages should be displayed in the Sent Panel
    And the Sent Panel paging message should include "26-"
    And the left paging icon should be enabled in the Sent Panel
