@messenger @production

@complete @slow @meesenger-smoke-test

    @complete
  Scenario: Send a message
    When I compose and send a valid message
    Then I should be informed that the message has been sent succesfully
    And the message should be visible in the "Sent" folder
    And the message should be visible in the "Messages" folder
    And the message should be visible on my facebook page

    @complete
  Scenario: Schedule a message
    When I compose a new Mesenger message
    And I schedule the message to be sent at some point in the distant future
    And I schedule the message
    Then I should be informed that the message has been scheduled succesfully
    And the message should be visible on the last page of the "Scheduled" folder

    @complete @slow
  Scenario: Send a message to twitter property
    When I compose and send a valid message for my twitter property
    Then I should be informed that the message has been sent succesfully
    And the message should be visible in the "Sent" folder
    And the message should be visible on my twitter page

    @not_started
   Scenario: Schedule a message to twitter property
    Given I have attempted to compose a twitter message
    And I scheduled the message to be sent at some point in the distant future
    And I schedule the message
    Then I should be informed that the message has been scheduled succesfully
    And the message should be visible on the last page of the "Scheduled" folder

   @complete
  Scenario: Post message with Link
    When I compose a new Mesenger message
    And I add a link to the message
    And I send the message
    Then the message should be visible in the "Sent" folder
    And the message should be visible on my facebook page
    And the message on my facebook page should have the links title and text
