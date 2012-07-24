@analytics
Feature: Track Your Competitors Default Comparisons

  Background:
    Given I navigate to the wildfire app monitor page

  @not_started @staging
  Scenario: Facebook Comparison
    When I type "<search_string>" in the "<position>" facebook searchbox and select "<expected_match>"
      | search_string        | position | expected_match             |
      | wildfire interactive | first    | Wildfire Interactive, Inc. |
      | nike                 | second   | Nike                       |
      | google               | third    | Google Chrome              |
    And I compare these competitors
    Then the Facebook comparison chart should be displayed
    And the properties should be included in the comparison table with Likes and Rank counts
    And there should be no Twitter comparison charts or table
    