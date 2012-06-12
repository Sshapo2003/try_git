@page_manager @amtest @staging @production
Feature: My Templates

  Background:
    Given I am logged in as "template-user"
    And I navigate to the wildfire app page manager page
    And I view "My Templates" in the left hand nav bar of Page Manager

  @complete
  Scenario: Template Menu Options
    Given I have at least one template
    Then the templates menu options should be
      | Edit Template Design |
      | Edit Default Content |
      | Download Template    |
      | Upload New Version   |
      | Clone Template       |
      | Delete Template      |

  @complete
  Scenario: Clone a Template
    When I clone a template
    Then an additional template should be listed in My Templates

  @complete
  Scenario: Create Blank Template
    When I create a Blank Template
    Then the template should be listed in My Templates

  @complete
  Scenario: Create Page
    Given I have a valid template
    When I create a page with the template
    Then the Page Editor should be displayed with the templates details

  @complete
  Scenario: Edit Template Design
    Given I have a valid template
    And I edit the templates design with some liquid content
    When I create a page with the template
    Then the Page Editor should be displayed with the updated template design

  @complete
  Scenario: Delete a Template
    Given I have created a valid template
    When I delete the template
    Then the template should be removed My Templates

  @complete
  Scenario: Edit Templates Default Content
    Given I have a valid template
    When I edit the templates default content
    When I create a page with the template
    Then the Page Editor should be displayed with the updated template content

  @complete
  Scenario: Upload New Template
    When I upload a new template 
    Then the template should be available for selection in My Templates

  @complete
  Scenario: Upload New Version of Template
    Given I have a valid uploaded template
    When I upload a new version of the template 
    And I create a page with the template
    Then the Page Editor should be displayed with the updated template design

  @not_started
  Scenario: Download a Template
    Given I have a valid template
    When I download the template
    Then the download dialog should be opened
