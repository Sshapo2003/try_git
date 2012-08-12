@page_manager @amtest @staging @production
Feature: Draft Pages

  Background:
    Given I am logged in to Wildfire as the template user
    And I navigate to the wildfire app page manager page
    And I view "Drafts" in the left hand nav bar of Page Manager

  @complete
  Scenario: Create a Page
    When I create a page in Drafts
    Then the Template Gallery page should be displayed

  @complete
  Scenario: Archive and Delete a Page
    When I archive a page
    Then there should be one less page in Drafts
    And the page should be listed in Archived
    When I delete the archived page
    Then there should be one less page in Archived

  @complete
  Scenario: Archive and Unarchive a Page
    When I archive a Page
    Then there should be one less page in Drafts
    And the page should be listed in Archived
    When I unarchive the archived page
    Then there should be one less page in Archived
    And the page should be listed in Drafts

  @complete
  Scenario: Archived Page Menu Options
    When I view the menu for a Draft Page
    Then the following menu options should be available for the draft page
    | Archive               |
    | Clone                 |
    | Delete                |
    | Edit Template Design  |
    | Edit Template Content |
