@messenger @production @staging @amtest
Feature: Messenger Inbox

  Background:
    Given I am logged in as "default"
    And I navigate to the wildfire app messenger page

  @complete @US5483
  Scenario: View Each Message Type
    When I click the "Messages" tab on the left navigation menu on wildfire app messenger page
    Then the header in the messages area should be "Messages"
    And the actions drop down on the "Messages" panel contains Assign, Delete and Unflag
    When I click the "Flagged Messages" tab on the left navigation menu on wildfire app messenger page
    Then the header in the messages area should be "Flagged Messages"
    And the actions drop down on the "Flagged Messages" panel contains Assign, Delete and Unflag
    When I click the "Assigned Messages" tab on the left navigation menu on wildfire app messenger page
    Then the header in the messages area should be "Assigned Messages"
    And the actions drop down on the "Assigned Messages" panel contains Assign, Delete and Unflag
    When I click the "Deleted Messages" tab on the left navigation menu on wildfire app messenger page
    Then the header in the messages area should be "Deleted Messages"
    And the actions drop down on the "Deleted Messages" panel contains Assign, Delete and Unflag
