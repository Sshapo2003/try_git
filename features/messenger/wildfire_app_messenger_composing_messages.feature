@messenger @production @amtest @staging
Feature: Composing Messages

  Background:
    Given I am logged in to Wildfire as the default user
    And I navigate to the wildfire app messenger page

  @complete
  Scenario: Compose message panel state
  When I click the "Compose" tab on the left navigation menu on wildfire app messenger page
    And I select the "Later" radio button on wildfire app messenger page
    And the "Schedule" button should be displayed on wildfire app messenger page
    When I click the "Messages" tab on the left navigation menu on wildfire app messenger page
    And I click the "Compose" tab on the left navigation menu on wildfire app messenger page
    Then the "Send" button should be displayed on wildfire app messenger page

  @complete
  Scenario: Missing required fields
    When I compose a new Mesenger message
    And I set the Messenger message date in the past
    And I schedule the message
    Then the "Please enter a time in the future." error message should be displayed on the message composition form

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

  # Cannot complete this test because message field is always blank with capybara
  @not_started
  Scenario: Link Shortener
    Given I compose a new Mesenger message
    And I add a long link to the message
    When I click the shorten link
    Then a shortened link should be inserted into the message field

  @complete @slow
  Scenario: Send a message
    When I compose and send a valid message
    Then I should be informed that the message has been sent succesfully
    And the message should be visible in the "Sent" folder
    And the message should be visible in the "Messages" folder
    And the message should be visible on my facebook page

  @complete @slow
  Scenario: Send a message to twitter property
    When I compose and send a valid message for my twitter property
    Then I should be informed that the message has been sent succesfully
    And the message should be visible in the "Sent" folder
    And the message should be visible on my twitter page

  @complete
  Scenario: Compose message with Link
    When I compose a new Mesenger message
    And I add a link to the message
    Then the link should have the following properties
      | Image    | wildfire.png           |
      | Title    | Wildfire               |
      | Body     | Login Demo Contact Us: |
      | Buttons  | Left and Right         |
    When I click the close button on the link attachment panel
    Then the link attachment panel should not be visible

  @complete
  Scenario: Post message with Link
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

  @complete
  Scenario: Schedule a message
    When I compose a new Mesenger message
    And I schedule the message to be sent at some point in the distant future
    And I schedule the message
    Then I should be informed that the message has been scheduled succesfully
    And the message should be visible on the last page of the "Scheduled" folder

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

  @not_started
  Scenario: Schedule a message to twitter property
    Given I have attempted to compose a twitter message
    And I scheduled the message to be sent at some point in the distant future
    And I schedule the message
    Then I should be informed that the message has been scheduled succesfully
    And the message should be visible on the last page of the "Scheduled" folder
