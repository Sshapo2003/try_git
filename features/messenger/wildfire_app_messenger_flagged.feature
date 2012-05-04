@messenger @production
Feature: Flagged Messages

  Background:
    Given I am logged in as "default"
    And I navigate to the wildfire app messenger page
    And I click the "Flagged Messages" tab on the left navigation menu on wildfire app messenger page

  @complete
  Scenario: Unflag a message
    Given I have an flagged message in Flagged Messages
    When I unflag the message
    Then the message should not be displayed in Flagged
