@gallery @production
Feature: Template Gallery

  Background:
    Given I am logged in to Wildfire as the default user
    And I navigate to the wildfire app templates page

  @complete
  Scenario: View all templates
    Given 12 templates are displayed
    When I scroll to the bottom of the page
    And I wait a little while for more templates to be loaded
    Then 24 templates should be displayed
    When I keep scrolling to the bottom of the page until no more templates load
    Then all available templates are visible

  @complete
  Scenario: Search for a template
    When I search for "tile" in the template search
    Then the "Tile Gallery 2.0" template should be displayed in the tile gallery

  @complete
  Scenario: Filter templates by Results
    When I filter by "Live Video" in the template search
    Then the "Art Video" template should be displayed in the tile gallery

  @complete
  Scenario: Filter templates by Features
    When I filter by "Virality" in the template search
    Then the "Instagram Feed" template should be displayed in the tile gallery

  @complete
  Scenario: Create Page from Template in Template Gallery
    When I click the Start Now button on any template
    Then the Page Manager page should be displayed
    And the sticky note on the Page Manager page should display "You have successfully created a page!"
