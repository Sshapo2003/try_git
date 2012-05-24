@plugins @production @staging
Feature: Plugins

Background:
    Given I am logged in as "default"
    And I navigate to the wildfire app page manager page

  @not_started
  Scenario: Should be able to create a template
    When I create and save a template
    Then the the template should be listed in my templates
