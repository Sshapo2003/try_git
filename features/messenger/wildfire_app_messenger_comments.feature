@messenger @production
Feature: Message Comments

Background:
    Given I am logged in to Wildfire as the default user
    And I navigate to the wildfire app messenger page

  @not_started
  Scenario: Message Comments
    Given I have a message with a comment
    Then the comment should be displayed in the messages panel
    When I like the comment
    Then "You like this Message" is displayed
    When I reply to the comment
    Then the reply should be visible in facebook
    And the like is visible in facebook
    