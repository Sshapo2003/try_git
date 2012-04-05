@messenger
Feature: Messenger Inbox

  Background:
    Given I am logged in as "default"
    And I navigate to the wildfire app messenger page

  @complete @US5483
  Scenario: View Each Message Type
    When I click the "Messages" tab on the left navigation menu on wildfire app messenger page
    Then the header in the messages area should be "Messages"
    When I click the "Flagged Messages" tab on the left navigation menu on wildfire app messenger page
    Then the header in the messages area should be "Flagged Messages"
    When I click the "Assigned Messages" tab on the left navigation menu on wildfire app messenger page
    Then the header in the messages area should be "Assigned Messages"
    When I click the "Deleted Messages" tab on the left navigation menu on wildfire app messenger page
    Then the header in the messages area should be "Deleted Messages"
