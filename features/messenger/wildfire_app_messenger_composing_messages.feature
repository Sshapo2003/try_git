@messenger @production
Feature: Composing Messages

  Background:
    Given I am logged in as "default"
    And I navigate to the wildfire app messenger page

  @complete
  Scenario Outline: Missing required fields
    When I compose a new Mesenger message
    And the "<Required_Field>" is left blank during message composition
    And I attempt to send the message
    Then the "<Error_Message>" error message should be displayed on the message composition form
  Examples:
    | Required_Field | Error_Message               |
    | Destination    | Please enter a destination. |
    | Message        | Please enter a message.     |

  @complete
  Scenario: Send a message
    When I compose and send a valid message
    Then I should be informed that the message has been sent succesfully
    And the message should be visible in the "Sent" folder
    And the message should be visible in the "Messages" folder
    And the message should be visible on my facebook page

  @complete
  Scenario: Send a message to twitter property
    When I compose and send a valid message for my twitter property
    Then I should be informed that the message has been sent succesfully
    And the message should be visible in the "Sent" folder
    And the message should be visible on my twitter page

  @complete
  Scenario: Compose message with Link
    When I compose a new Mesenger message
    And I add a link to the message
    And I send the message
    Then the message should be visible in the "Sent" folder
    And the message should be visible on my facebook page
    And the message on my facebook page should have the links title and text

  @complete
  Scenario: Save a Draft
    When I compose a new Mesenger message
    And I save the message as a draft
    Then I should be informed that the message has been saved as a draft
    And the message should be visible in the "Drafts" folder

  @not_started
  Scenario: Schedule a message
    When I compose a new Mesenger message
    And I schedule the message to be sent at some point in the distant future
    And I send the scheduled message
    Then I should be informed that the message has been scheduled succesfully
    And the message should be visible in the "Scheduled" folder

  @not_started
  Scenario: Compose message with Flash
    When I compose a new Mesenger message
    And I add a Flash Video and Image to the message
    And I give the Flash Attachment a Title and Description
    And I Send the message
    Then the message should be visible in the "Sent" folder
    And the flash attachment of the sent message should have an title and text

  @not_started
  Scenario: Compose message with Photo
    When I compose a new Mesenger message
    And I add a link to the message
    Then the link image title and text should be shown in the message composition panel

  @not_started
  Scenario: Compose message with Album
    When I compose a new Mesenger message
    And I add a link to the message
    Then the link image title and text should be shown in the message composition panel
