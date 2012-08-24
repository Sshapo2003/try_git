@messenger @production @staging @amtest
Feature: Filters

  Background:
    Given I am logged in to Wildfire as the default user
    And I navigate to the wildfire app messenger page
    And I click the "Filters" tab on the left navigation menu on wildfire app messenger page

  @complete
  Scenario Outline: Missing required fields
    Given I create a filter
    But the "<Required_Field>" field is left blank during filter creation
    Then I attempt to save the filter
    Then the "<Error_Message>" error message should be displayed on the filter creation form
  Examples:
    | Required_Field | Error_Message               |
    | Name           | Name can't be blank         |
    | Keywords       | Keywords can't be blank     |

  @complete
  Scenario: Create a filter
    When I create and save a valid filter
    Then the filter should added to the list of filters

  @complete
  Scenario: Assign a filter
    Given I have an unassigned filter
    When I assign the filter to my company
    Then the filter page should show that the filter is assigned to my company

  @complete
  Scenario: Unassign a filter
    Given I have a filter assigned to my company
    When I unassign the filter from my company
    Then the filter page should show that the filter is not assigned to my company

  @complete
  Scenario: Edit a filter
    Given I have a filter with 1 keyword
    When I add another keyword to the filter
    Then the filter page should show that the filter has 2 keywords

  @complete
  Scenario: Delete a filter
    Given I have a filter
    When I delete the filter
    Then the filter should removed from the list of filters

  @failing
  Scenario: Trigger a flag filter
    When I send a facebook message which matches a "Flag" filter
    And I navigate to the wildfire app messenger page
    And I click the "Flagged Messages" tab on the left navigation menu on wildfire app messenger page
    Then the message should be listed in flagged folder

  @failing
  Scenario: Trigger a delete filter
    When I send a facebook message which matches a "Delete" filter
    And I navigate to the wildfire app messenger page
    And I click the "Deleted Messages" tab on the left navigation menu on wildfire app messenger page
    Then the message should be listed in deleted folder
