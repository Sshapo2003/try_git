@messenger @production
Feature: Template Gallery

  Background:
    Given I am logged in as "default"
    And I navigate to the wildfire app templates page

  @complete
  Scenario: View more templates
    Given 12 templates are displayed
    When I scroll to the bottom of the page
    And I wait a little while for more templates to be loaded
    Then 24 templates should be displayed

  @complete
  Scenario: View all templates
    Given 12 templates are displayed
    When I keep scrolling to the bottom of the page until no more templates load
    Then all available templates are visible

  @complete
  Scenario: Search for a template
    When I search for "tile" in the template search
    Then the "Tile Gallery" template should be displayed in the tile gallery

  @complete
  Scenario: Filter templates by Results
    When I filter by "Live Video" in the template search
    Then the "Art Video" template should be displayed in the tile gallery

  @complete
  Scenario: Filter templates by Features
    When I filter by "Virality" in the template search
    Then the "Instagram Feed" template should be displayed in the tile gallery
