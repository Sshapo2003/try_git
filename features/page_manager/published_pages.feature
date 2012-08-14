@page_manager @amtest @staging @production
Feature: Published Pages

  Background:
    Given I am logged in to Wildfire as the template user
    And I navigate to the wildfire app page manager page
    And I view "Published" in the left hand nav bar of Page Manager

  @complete
  Scenario: Create a Page
    When I create a page in Published
    Then the Template Gallery page should be displayed
