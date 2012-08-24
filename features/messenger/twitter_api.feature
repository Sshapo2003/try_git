@twitter_api
Feature: Testing the Twitter API

  @complete
  Scenario: Get a message from Twitter
    Given I have an active twitter account
    When I request the first message using the twitter API
    Then I should get a valid message

  @complete
  Scenario: Send a message to Twitter
    Given I have an active twitter account
    When I send a message using the twitter API
    Then the message should be visible on my timeline

  @complete
  Scenario: Reply to a message to Twitter
    Given the poster is the active twitter account
    When I reply to another users message 
    Then the reply should be visible on the users timeline