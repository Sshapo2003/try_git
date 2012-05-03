@messenger @production
Feature: Creating Pages from Templates

  Background:
    Given I am logged in as "default"
    And I navigate to the wildfire app templates page

  @complete
  Scenario: Tile Gallery template 
    When I create a page from the "Tile Gallery" template
    And I publish the template
    Then the published template should be visible on my facebook page
