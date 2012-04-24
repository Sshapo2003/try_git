@messenger @production
Feature: Draft Messages

  Background:
    Given I am logged in as "default"
    And I navigate to the wildfire app messenger page
    And I view the "Drafts" tab

  @not_started
  Scenario: Send a Draft
    Given I have a valid draft message
    When I send the message
    Then I should be informed that the message has been sent succesfully
    And the message should not be visible in the "Drafts" folder
    And the message should be visible in the "Sent" folder
    And the message should be visible in the "Messages" folder

  @not_started
  Scenario: Delete a Draft
    Given I have a valid draft message
    When I delete the draft message
    Then I should be informed that the message has been sent succesfully

  @not_started
  Scenario: Drafts Panel Paging
    Given I have more than 25 draft messages
    Then 25 drafts should be displayed in the Drafts Panel
    And the Drafts Panel paging message should display "1-25 of"
    And the right paging icon should be enabled in the Drafts Panel
    When I click the right paging icon in the Drafts Panel
    Then more drafts should be displayed
    And the Drafts Panel paging message should display "26-"
    And the left paging icon should be enabled in the Drafts Panel
