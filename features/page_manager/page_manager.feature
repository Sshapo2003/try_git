@page_manager @amtest @staging @production
Feature: Page Manager General Functionality

  Background:
    Given I am logged in to Wildfire as the template user
    And I navigate to the wildfire app page manager page

  @complete
  Scenario: View Each Page Manager Tab
    When I view the Page Managers "Published" tab
    When I view the Page Managers "Drafts" tab
    When I view the Page Managers "Archived" tab
    When I view the Page Managers "My Templates" tab
    When I view the Page Managers "Upload a Template" tab
    