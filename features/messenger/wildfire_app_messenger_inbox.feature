@messenger
Feature: Messenger Inbox

  Background:
    Given I am logged in to Wildfire as the default user
    And I navigate to the wildfire app messenger page

  # Currently not production - waiting for uitk5
  @complete @US5483 @amtest @staging
  Scenario: View Each Message Type
    When I click the "Messages" tab on the left navigation menu on wildfire app messenger page
    Then the header in the messages area should be "Messages"
    And the actions on the "Messages" panel are Assign, Delete and Unflag
    When I click the "Flagged Messages" tab on the left navigation menu on wildfire app messenger page
    Then the header in the messages area should be "Flagged Messages"
    And the actions on the "Flagged Messages" panel are Assign, Delete and Unflag
    When I click the "Assigned Messages" tab on the left navigation menu on wildfire app messenger page
    Then the header in the messages area should be "Assigned Messages"
    And the actions on the "Assigned Messages" panel are Assign, Delete and Unflag
    When I click the "Deleted Messages" tab on the left navigation menu on wildfire app messenger page
    Then the header in the messages area should be "Deleted Messages"
    And there should be a "Clear Deleted Messages" button on the "Deleted Messages" panel
