@account_management @production @staging @amtest
Feature: Register with Wildfire

  Background:
    When I navigate to the signup page
    
  @not-started
  Scenario: Register with valid details

  @complete
  Scenario: Invalid Registration
    When I submit the signup form
    Then the registration page should display the signup error message "We were unable to create your account. Please review the errors below and try again."
    
  @complete
  Scenario: Blank First Name
    When I complete the registration form
    But I leave the firstname value blank
    When I submit the signup form
    Then the registration page should display the validation error message "First name can't be blank"

  @complete
  Scenario: Blank Last Name
    When I complete the registration form
    But I leave the lastname value blank
    When I submit the signup form
    Then the registration page should display the validation error message "Last name can't be blank"

  @complete
  Scenario: Blank Company Name
    When I complete the registration form
    But I leave the companyname value blank
    When I submit the signup form
    Then the registration page should display the validation error message "Company can't be blank"

  @complete
  Scenario: Blank Email Address
    When I complete the registration form
    But I leave the email value blank
    When I submit the signup form
    Then the registration page should display the validation error message "Email can't be blank"

  @complete
  Scenario: Email Address Already Taken
    When I complete the registration form
    But the email address has already been reqistered
    When I submit the signup form 
    Then the registration page should display the validation error message "Email has already been taken"

  @complete
  Scenario: Blank Password
    When I complete the registration form
    But I leave the password value blank
    When I submit the signup form
    Then the registration page should display the validation error message "Password can't be blank"

  @complete
  Scenario: Terms Not Accepted
    When I complete the registration form
    But I dont accept the terms
    When I submit the signup form
    Then the registration page should display the terms validation error message "Terms must be accepted"

  @complete
  Scenario: Has Terms of Service link
    Then the registration page should have a link to the terms of service page

  @complete
  Scenario: Go to Existing Login page
    When I click the "Use your existing login" link
    Then the login page should be loaded
