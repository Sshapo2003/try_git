@messenger_admin @production
Feature: Messenger Admin Login

  Background:
    Given I am logged into the messenger admin site

  @complete
  Scenario: Correct tabs shown
    Then the following tabs should be visible on the messenger admin page
    |Dashboard                 |
    |Outgoing Messages         |
    |Sending Failures          |
    |Resque                    |
    |Errors                    |
    |KPI Report                |
    |Refresh a Social Property |
