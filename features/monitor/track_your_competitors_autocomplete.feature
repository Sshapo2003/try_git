@analytics
Feature: Track Your Competitors Autocompletion

  Background:
    Given I navigate to the wildfire app track your competitors page

  @complete @staging
  Scenario: Search for Wildfire in Facebook Search Field
    When I type "wildfire" in the facebook searchbox
    Then the first row should be 'Compare using "wildfire" OR choose a suggestion below'
    And every result should have "wildfire" in the title

  @not_started
  Scenario: Search for results in all search fields
    When I type "<search_string>" in the "<position>" facebook searchbox and select "<expected_match>"
      | search_string | position | expected_match |
      | Walm          | first    | Walmart        |
      | Targ          | second   | Target         |
      | Amaz          | third    | Amazon.com     |
    And I type "<search_string>" in the "<position>" twitter searchbox and select "<expected_match>"
      | search_string | position | expected_match                 |
      | Domin         | first    | @dominos (Domino's Pizza)      |
      | Papa Jo       | second   | @PapaJohns (Papa John's Pizza) |
      | Pizza H       | third    | @pizzahut (Pizza Hut)          |
