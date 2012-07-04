@gallery @templates @production
Feature: Creating Pages from Templates

  Background:
    Given I am logged in to Wildfire as the default user
    And I navigate to the wildfire app templates page

  @complete
  Scenario: Tile Gallery template 
    When I create a page from the "Tile Gallery 2.0" template
    And I publish the template
    Then the published template should be visible on my facebook page

  @complete
  Scenario: Sliding Gallery 2.0 template 
    When I create a page from the "Sliding Gallery 2.0" template
    And I publish the template
    Then the published template should be visible on my facebook page

  @complete
  Scenario: Signup Form, Gallery and RSS template 
    When I create a page from the "Signup Form, Gallery and RSS" template
    And I publish the template
    Then the published template should be visible on my facebook page
