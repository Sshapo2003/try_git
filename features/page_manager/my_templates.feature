@page_manager @amtest @staging @production
Feature: My Templates

  Background:
   Given I am logged in as "default"
   And I navigate to the wildfire app page manager page
  And I view "My Templates" in the left hand nav bar of Page Manager

  @complete
  Scenario: Publish an update to an App in Page Manager
    Given I have at least one template
    Then the templates menu options should be
      | Edit Template Design |
      | Edit Default Content |
      | Download Template    |
      | Upload New Version   |
      | Clone Template       |
      | Delete Template      |

  @not_started
  Scenario: Create Page
    Given I have a valid template
    When I create a page with the template
    Then the Page Editor should be displayed with the templates details

  @not_started
  Scenario: Upload New Template
    When I upload Upload new template 
    Then the "Upload a Template" page should be displayed

  @complete
  Scenario: Create Blank Template
    When I create a Blank Template
    Then the template should be listed in My Templates

  @not_started
  Scenario: Edit Template Design
    Given I have a valid template
    When I edit the templates design
    Then the "Markup" page should be displayed

  @not_started
  Scenario: Edit Templates Default Content
    Given I have a valid template
    When I edit the templates default content
    Then the "Default Content" page should be displayed

  @not_started
  Scenario: Download a Template
    Given I have a valid template
    When I download the template
    Then the download dialog should be opened

  @not_started
  Scenario: Upload New Version of Template
    Given I have a valid template
    When I upload Upload a new version of the template 
    Then the "Upload a Template" page should be displayed

  @complete
  Scenario: Clone a Template
    When I clone a template
    Then the template should be listed in My Templates

  @not_started
  Scenario: Delete a Template
    Given I have a valid template
    When I clone the template
    Then the template should be removed My Templates


