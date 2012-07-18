@messenger @amtest @staging @production

Feature: Messenger notifications: invlaid token scenarios for FB and Twitter properties.

Background:
    Given I am logged in to Wildfire as the default user

@not_started
Scenario: Triggers invalid token notification by changing facebook password
 Given I have changed the password of my facebook property
 When I attempt to send a message via messenger
 Then I should see the notification
 When I click on notification
 Then I should see the notification details "your social property [name] has become invalid "

@not_started
Scenario: Triggers invalid token notification after removing the default app from FB
 Given I have removed the wildfire default app from the facebook settings page
 When I attempt to send a message
 Then I should receive a notification
 When I click on the notification
 Then I should see the notification details "your social property [name] has become invalid"

 @not_started
 Scenario: Triggers invalid token notification after removing the custom app from FB
  Given I have removed the custom app from the facebook settings page
  When I attempt to send a message
  Then I should receive notifications
  When I click on the notifications
  Then I should see the notification details " your social property [name] has become invalid"

  @not_started
 Scenario: Triggers invalid token notification after removing the wildfire app from the twitter property
  Given I am logged into my twitter account
  Then I removed the wildfire app
  When I attempt to send a message with twitter property
  Then I should receive a notification
  When I click on the notification
  Then I should see the notification details "your social property [name]has become invalid"

