@messenger @amtest @staging @production
Invalid token scenarios 

Feature: Messenger notifications: invlid token

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
Scenario: Triggers invalid token notification by remove default app
 Given I have removed the wildfire default app from the facebook settings page
 When I attempt to send a message
 Then I should receive a notification
 When I click on the notification
 Then I should see the notification details "your social property [name] has become invalid"
