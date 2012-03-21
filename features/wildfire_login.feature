@account_management
Feature: Login to Wildfire

  Background:
    When I navigate to the login page

  @complete
  Scenario: Successful Login
    When I login with email "wildfirecuketest@mailinator.com" and password "w1ldfirecuketest"
    Then I should be successfully logged in as "Cuke4You"

  @complete
  Scenario: Unsuccesful Login - Wrong Email
    When I login with email "notregistered@mailinator.com" and password "w1ldfirecuketest"
    Then the login page should display the message "Invalid email or password provided."
  
  @complete
  Scenario: Unsuccesful Login - Wrong Password  
    When I login with email "notregistered@mailinator.com" and password "n0tmypassword"
    Then the login page should display the message "Invalid email or password provided."

  @not_started
  Scenario: View Privacy Policy

  @not_started
  Scenario: Go to Forgotten Password page

  @not_started
  Scenario: Go to Forgotten Password page

  @not_started
  Scenario: Go to Sign Up for an Account page
