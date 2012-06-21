@page_manager @amtest @staging @production
Feature: Draft Templates

  Background:
    Given I am logged in to Wildfire as the template user
    And I navigate to the wildfire app page manager page
    And I view "Drafts" in the left hand nav bar of Page Manager

  @complete
  Scenario: Create a Page
    When I create a page in Drafts
    Then the Template Gallery page should be displayed

  @not_started
  Scenario: Archive a Template
    When I archive a Template
    Then the template should be listed in Archived

  @complete
  Scenario: Archived Template Menu Options
    When I view the menu for a Draft Template
    Then the following menu options should be available for the draft template
    | Archive               |
    | Clone                 |
    | Delete                |
    | Edit Template Design  |
    | Edit Template Content |
