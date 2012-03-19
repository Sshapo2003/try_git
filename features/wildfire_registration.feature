@account_management
Feature: Register with Wildfire

  Background:
    When I navigate to the signup page

  @complete
  Scenario: Invalid Registration
    When I Create Account
    Then the registration page should display the signup error message "We were unable to create your account. Please review the errors below and try again."
    
  @complete
  Scenario: Blank First Name
    When I complete the registration form
    But I leave the firstname value blank
    When I Create Account 
    Then the registration page should display the validation error message "First name can't be blank"

  @complete
  Scenario: Blank Last Name
    When I complete the registration form
    But I leave the lastname value blank
    When I Create Account 
    Then the registration page should display the validation error message "Last name can't be blank"

  @complete
  Scenario: Blank Company Name
    When I complete the registration form
    But I leave the companyname value blank
    When I Create Account 
    Then the registration page should display the validation error message "Company can't be blank"

  @complete
  Scenario: Blank Email Address
    When I complete the registration form
    But I leave the email value blank
    When I Create Account 
    Then the registration page should display the validation error message "Email can't be blank"

  @complete
  Scenario: Blank Password
    When I complete the registration form
    But I leave the password value blank
    When I Create Account 
    Then the registration page should display the validation error message "Password can't be blank"

  @complete
  Scenario: Terms Not Accepted
    When I complete the registration form
    But I dont accept the terms
    When I Create Account
    Then the registration page should display the terms validation error message "Terms must be accepted"

  # The terms open in a new windoe and it is difficult to go to new window with Capybara
  @notstarted
  Scenario: View Terms of Service
    When I view the terms of service
    Then the terms and conditions page should be loaded

  @wip
  Scenario: Go to Existing Login page
    When I click the "Use your existing login" link
    Then the login page should be loaded

  @otstarted
  Scenario: Hide Error Message