@messenger_admin
Feature: Messenger Admin Sending Failures

  Background:
    Given I am logged into the messenger admin site

  @wip @cant_complete_until_i_have_a_generic_google_user_account_i_dont_want_to_commit_my_password_to_github
  Scenario: Correct tabs shown
    Then the following tabs should be visible on the messenger admin page
    |Dashboard        |
    |Outgoing Messages|
    |Activity         |
    |Resque           |
    |Errors           |
    |KPI Report       |
