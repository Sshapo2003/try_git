@analytics
Feature: Track Your Competitors Page

  Background:
    Given I navigate to the wildfire app track your competitors page

  @staging @not_started
  Scenario: Example facebook comparisson
    When I follow the Walmart vs target vs amazon.com comparison link
    Then the monitor page should be loaded with these Facebook properties
      | Walmart    |
      | Target     |
      | Amazon.com |
    And the facebook chart should be loaded
    And the facebook data table should be loaded

  @not_started
  Scenario: Example twitter comparisson
    When I follow the Domino's Pizza vs Papa John's Pizza vs Pizza Hut comparison link
    Then the monitor page should be loaded with these Twitter properties
      | Domino's Pizza    |
      | Papa John's Pizza |
      | Pizza Hut         |
      