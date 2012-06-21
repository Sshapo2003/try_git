@messenger
Feature: Composing Messages

  Background:
    Given I am logged in to Wildfire as the default user
    And I navigate to the wildfire app messenger page

  @complete @failing @amtest
  Scenario: Schedule a message
    When I compose a new Mesenger message
    And I schedule the message to be sent at some point in the distant future
    And I schedule the message
    Then I should be informed that the message has been scheduled succesfully
    And the message should be visible on the last page of the "Scheduled" folder

  @complete @production @staging
  Scenario: Schedule a message
    When I compose a new Mesenger message
    And I schedule the message to be sent at some point in the distant future
    And I schedule the message
    Then I should be informed that the message has been scheduled succesfully
    And the message should be visible on the last page of the "Scheduled" folder