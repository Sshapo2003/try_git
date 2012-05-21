@messenger @production @staging @amtest
Feature: Facebook

  Background:
    Given I am logged in as "default"

  @complete
  Scenario: Trigger a flag filter
    When I send a facebook message which matches a "Flag" filter
    When I navigate to the wildfire app messenger page
    And I click the "Flagged Messages" tab on the left navigation menu on wildfire app messenger page
    Then the message should be listed in flagged folder

  @complete
  Scenario: Trigger a delete filter
    When I send a facebook message which matches a "Delete" filter
    When I navigate to the wildfire app messenger page
    And I click the "Deleted Messages" tab on the left navigation menu on wildfire app messenger page
    Then the message should be listed in deleted folder
