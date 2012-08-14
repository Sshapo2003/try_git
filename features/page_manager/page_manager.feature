@page_manager @amtest @staging @production
Feature: Page Manager General Functionality

  Background:
    Given I am logged in to Wildfire as the template user
    And I navigate to the wildfire app page manager page

  @complete @slow
  Scenario: View Each Page Manager Tab
    When I view the Page Managers "Published" tab
    Then the header in the panel should be "Published"
    When I view the Page Managers "Drafts" tab
    Then the header in the panel should be "Drafts"
    When I view the Page Managers "Archived" tab
    Then the header in the panel should be "Archived"
    When I view the Page Managers "My Templates" tab
    Then the header in the panel should be "My Templates"
    When I view the Page Managers "Upload a Template" tab
    Then the header in the panel should be "Upload a Template"
    