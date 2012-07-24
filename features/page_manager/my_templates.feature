@page_manager
Feature: My Templates

  Background:
    Given I am logged in to Wildfire as the template user
    And I navigate to the wildfire app page manager page
    And I view "My Templates" in the left hand nav bar of Page Manager

  @complete @amtest @staging @production
  Scenario: Clone a Template
    When I clone a template
    Then an additional template should be listed in My Templates

  @complete @amtest @staging @production
  Scenario: Create Blank Template
    When I create a Blank Template
    Then the template should be listed in My Templates

  @complete @amtest @staging @production
  Scenario: Create Page
    Given I have a valid template
    When I create a page with the template
    Then the Page Editor should be displayed with the templates details

  @complete @amtest @staging @production
  Scenario: Edit Template Design
    Given I have a valid template
    And I edit the templates design with some liquid content
    When I create a page with the template
    Then the Page Editor should be displayed with the updated template design

  @complete @amtest @staging @production
  Scenario: Delete a Template
    Given I have created a valid template
    When I delete the template
    Then the template should be removed My Templates

  @not_started
  Scenario: Attempt Delete a Template with a Draft
    Given I have created a valid template
    When I delete the template
    Then the template should be removed My Templates

  @not_started
  Scenario: Attempt Delete a Template with a Published Page
    Given I have created a valid template
    When I delete the template
    Then the template should be removed My Templates

  @complete @amtest @staging @production
  Scenario: Edit Templates Default Content
    Given I have a valid template
    When I edit the templates default content
    When I create a page with the template
    Then the Page Editor should be displayed with the updated template content

  @complete @amtest @staging @production
  Scenario: Upload New Template
    When I upload a new template 
    Then the template should be available for selection in My Templates

  @complete @amtest @staging @production
  Scenario: Upload New Version of Template
    Given I have a valid uploaded template
    When I upload a new version of the template 
    And I create a page with the template
    Then the Page Editor should be displayed with the updated template design

  @complete @amtest @staging @production
  Scenario: Download a Template
    Given I have a valid template
    Then the template should have a valid download option
