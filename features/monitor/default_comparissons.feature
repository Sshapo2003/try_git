@analytics @staging
Feature: Default Comparissons

  Background:
    Given I navigate to the wildfire app monitor page

  @not_started
  Scenario: Simple Comparisson
    Given I so a facebook comparisson of the property "Wildfire"
