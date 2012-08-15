@messenger
Feature: Scraping Messages

  As a user of Messenger
  So that I can get the latest messages directed at my account
  I want Messenger to reguarly check for new messages

  @not_started @slow
  Scenario: New Text Messages Are Scraped
    Given I send a new test message to my Facebook property
    Then the message should be available in Messenger within 3 minutes
    