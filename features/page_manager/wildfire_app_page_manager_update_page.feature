@page_manager @production @staging
Feature: Update Page

  Background:
   Given I am logged in as "default"
   And I navigate to the wildfire app page manager page

  @complete
  Scenario: Publish an update to an App in Page Manager
    When I update and publish the Countdown App
    And I view the "PaloAltoFoodies" facebook page 
    And I view the "Countdown" app page
    Then the updates to the "Countdown" app should be visible
