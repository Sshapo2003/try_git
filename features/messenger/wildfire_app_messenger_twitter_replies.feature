@messenger
Feature: Twitter Replies

  # Currently not running on Production until Uitk5 changes applied
  @not_started @no-ci @amtest @staging @production
  Scenario: Should be able to see replies to a twitter message
    Given I have a twitter message with multiple replies from another user
    When I view the wildfire app messenger page as the default user
    And I view the replies for the twitter message
    Then each of the replies should be visible in wildfire messenger in chronological order
    And each of the replies should have a Reply button
    When I click the reply button for one of the messages
    Then the reply field should be prepopulated with the other users name
    When I enter a message with more than 140 characters
    Then the character count should become a negative value
    And the Tweet button should be disabled
    When I enter a message with a valid number of characters
    Then the character count should become a positive value
    And the Tweet button should be enabled
    When I send the reply to the twitter message
    Then I should be informed that the reply has been sent
    And the message should be visible on my twitter page

  @complete @no-ci @amtest @staging @production
  Scenario: View a tweet with no replies
    Given I have a tweet with no replies
    When I view the wildfire app messenger page as the default user
    And I view the replies for the twitter message
    Then I should be informed that there are no replies
