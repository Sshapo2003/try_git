@page_manager @amtest @staging @production
Feature: Edit Template

  Background:
    Given I am logged in to Wildfire as the template user
    And I navigate to the wildfire app page manager page
    And I view "My Templates" in the left hand nav bar of Page Manager
    And I have created a valid template
    And I edit the templates content

  @complete
  Scenario: Update all elements with valid content
    When I edit the template with the following content
      | Template Name        | My Updated Template        |
      | Template Description | This is an edited template |
      | Screenshot           | logo-wildfire-lrg.jpg      |
      | Tags                 | Brand Awareness            |
      | Privacy              | Public Template            |
    When I edit the templates content
    Then the updates to the template content should have been applied
