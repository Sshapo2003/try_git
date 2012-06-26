@messenger @amtest @staging @production
Feature: Message Comments

Background:
    Given I am logged in to Wildfire as the default user
    And I navigate to the wildfire app messenger page

  @complete
  Scenario: Commenting and Liking a message
    Given I have a message with a comment
    When I like the comment
    Then the comment should be liked
    When I reply to the comment
    Then the reply should be visible in facebook
    And the like is visible in facebook
    