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

  @complete
  Scenario: Archive and Delete a Template
    When I archive a Template
    Then there should be one less template in Drafts
    And the template should be listed in Archived
    When I delete the archived template
    Then there should be one less template in Archived

  @complete
  Scenario: Archive and Unarchive a Template
    When I archive a Template
    Then there should be one less template in Drafts
    And the template should be listed in Archived
    When I unarchive the archived template
    Then there should be one less template in Archived
    And the template should be listed in Drafts

  @complete
  Scenario: Archived Template Menu Options
    When I view the menu for a Draft Template
    Then the following menu options should be available for the draft template
    | Archive               |
    | Clone                 |
    | Delete                |
    | Edit Template Design  |
    | Edit Template Content |
