@messenger @production
Feature: Filters

  Background:
    Given I am logged in as "default"
    And I navigate to the wildfire app messenger page
    And I click the "Filters" tab on the left navigation menu on wildfire app messenger page

  @not_started
  Scenario Outline: Missing required fields
    When the "<Required_Field>" is left blank during filter creation
    And I attempt to save the filter
    Then the "<Error_Message>" error message should be displayed on the filter creation form
  Examples:
    | Required_Field | Error_Message               |
    | Name           | Name can't be blank         |
    | Keywords       | Keywords can't be blank     |

  @not_started
  Scenario: Create a filter
    When I create a valid filter
    And I save the filter
    Then the filter should added to the list of filters

  @not_started
  Scenario: Assign a filter
    Given I have a filter
    When I assign the filter to my company
    Then the filter page should show that the filter is assigned to my company

  @not_started
  Scenario: Unassign a filter
    Given I have a filter assigned to my company
    When I unassign the filter from my company
    Then the filter page should show that the filter is not assigned to my company

  @not_started
  Scenario: Edit a filter
    Given I have a filter with 1 keyword
    When I add another keyword to the filter
    Then the filter page should show that the filter has 2 keywords

  @not_started
  Scenario: Delete a filter
    Given I have a filter
    When I delete the filter
    Then the filter should removed from the list of filters
