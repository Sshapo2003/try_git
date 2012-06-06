@messenger @amtest @staging @production
Feature: Twiter Replies

  Background:
    Given I am logged in as "default"
    And I navigate to the wildfire app messenger page

  @complete
  Scenario: Should be able to see replies to a twitter message
    Given I have a twitter message
    When the message receives a reply
    Then the reply should be visible in my wildfire messenger messages
