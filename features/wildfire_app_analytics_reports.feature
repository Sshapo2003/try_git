@messenger
Feature: Analytics Reports

  Background:
    Given I am logged in as "default"
    And I navigate to the wildfire app analytics page

  @not_started
  Scenario: View Each Report Type
    Then the "Overview" panel should be highlighted and displayed
    When I click the "Industry Benchmarks" tab on the left navigation menu on wildfire app analytics page
    Then the "Overview" panel should be highlighted and displayed
    When I click the "Tabs" tab on the left navigation menu on wildfire app analytics page
    Then the "Overview" panel should be highlighted and displayed
    When I click the "Pages" tab on the left navigation menu on wildfire app analytics page
    Then the "Overview" panel should be highlighted and displayed
    When I click the "Posts" tab on the left navigation menu on wildfire app analytics page
    Then the "Overview" panel should be highlighted and displayed
    When I click the "Referral Sources" tab on the left navigation menu on wildfire app analytics page

  @not_started
  Scenario: Overview Reports Panel
    Then the "Promotions" panel should be visible in the dashboard area
    And the "Promotions" panel title should be "Promotions"
    And the number of promos run should be visible in the promotions panel
    And the number of total entries should be visible in the promotions panel
    And the "Audience" panel should be visible in the dashboard area
