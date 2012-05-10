@messenger @production
Feature: Draft Messages

  Background:
    Given I am logged in as "default"
    And I navigate to the wildfire app messenger page
    And I click the "Drafts" tab on the left navigation menu on wildfire app messenger page

  @complete
  Scenario: Send a Draft
    Given I have a valid draft message
    When I edit the draft
    And I send the draft message
    Then I should be informed that the draft message has been sent succesfully
    And the message should not be visible in the drafts folder
    And the message should be visible in the "Sent" folder

  @complete
  Scenario: Delete a Draft
    Given I have a valid draft message
    When I delete the draft message
    Then I should be informed that the draft has been deleted
    And the message should not be visible in the drafts folder

  @complete
  Scenario: Drafts Panel Paging
    Given I have more than 25 draft messages
    Then 25 drafts should be displayed in the Drafts Panel
    And the Drafts Panel paging message should include "1-25"
    And the right paging icon should be enabled in the Drafts Panel
    When I click the right paging icon in the Drafts Panel
    Then more drafts should be displayed
    And the Drafts Panel paging message should include "26-"
    And the left paging icon should be enabled in the Drafts Panel
