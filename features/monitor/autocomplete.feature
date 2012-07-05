@analytics @staging
Feature: Default Comparissons

  Background:
    Given I navigate to the wildfire app track your competitors page

  @complete
  Scenario: Simple Comparisson
    When I type "wildfire" in the facebook searchbox
    Then the first row should be 'Compare using "wildfire" OR choose a suggestion below'
    And every result should have "wildfire" in the title
