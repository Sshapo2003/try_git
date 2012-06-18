@analytics @production
Feature: Analytics Reports

  Background:
    Given I am logged in to Wildfire as the default user
    And I navigate to the wildfire app analytics page

  @complete
  Scenario: View Each Report Type
    Then the "Overview" tab should be highlighted
    And the "Promotions" panel should be visible in the main page area on wildfire app analytics page
    And the "Audience" panel should be visible in the main page area on wildfire app analytics page
    When I click the "Industry Benchmarks" tab on the left navigation menu on wildfire app analytics page
    Then the "Industry Benchmarks" tab should be highlighted
    And the "Industry Benchmarks" panel should be visible in the main page area on wildfire app analytics page
    And the "Industry Benchmarks" sticky should be visible in the main page area on wildfire app analytics page
    When I click the "Tabs" tab on the left navigation menu on wildfire app analytics page
    Then the "Tabs" tab should be highlighted
    And the "Tabs" panel should be visible in the main page area on wildfire app analytics page
    And the "Tabs" sticky should be visible in the main page area on wildfire app analytics page
    When I click the "Pages" tab on the left navigation menu on wildfire app analytics page
    Then the "Pages" tab should be highlighted
    And the "Pages" panel should be visible in the main page area on wildfire app analytics page
    And the "Pages" sticky should be visible in the main page area on wildfire app analytics page
    When I click the "Posts" tab on the left navigation menu on wildfire app analytics page
    Then the "Posts" tab should be highlighted
    And the "Posts" panel should be visible in the main page area on wildfire app analytics page
    And the "Posts" sticky should be visible in the main page area on wildfire app analytics page
    When I click the "Referral Sources" tab on the left navigation menu on wildfire app analytics page
    Then the "Referral Sources" tab should be highlighted
    And the "Referral Sources" panel should be visible in the main page area on wildfire app analytics page
