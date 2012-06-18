@plugins @production @staging
Feature: Plugins

Background:
    Given I am logged in to Wildfire as the default user
    And I navigate to the wildfire app page manager page

  @not_started
  Scenario: Should be able to create a template
    When I create and save a template
    Then the the template should be listed in my templates

  @not_started
  Scenario: Add a raw text template
    Given A blank a template
    When I add the following liquid
      """
        {% plugin rawtext twitter_handle %}
        <a href="http://twitter.com/%7B%7B%20twitter_handle%20%7D%7D">Follow me on Twitter!</a>'
      """
    And I create a page with the template
    Then the page should contain
      """
        Follow me on Twitter!
      """
