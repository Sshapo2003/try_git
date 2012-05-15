@messenger @production
Feature: Scheduled Messages

  Background:
    Given I am logged in as "default"
    And I navigate to the wildfire app messenger page
    And I click the "Scheduled" tab on the left navigation menu on wildfire app messenger page

  @complete
  Scenario: Scheduled Panel Paging
    Given I have more than 25 scheduled messages
    Then 25 messages should be displayed in the Scheduled Panel
    And the Scheduled Panel paging message should include "1-25"
    And the right paging icon should be enabled in the Scheduled Panel
    When I click the right paging icon in the Scheduled Panel
    Then more messages should be displayed
    And the Scheduled Panel paging message should include "26-"
    And the left paging icon should be enabled in the Scheduled Panel
