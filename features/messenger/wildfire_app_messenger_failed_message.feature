@messenger @production @staging @amtest
Feature: Messenger notifications: Failed sent message

Background:
    Given I am logged in to Wildfire as the default user

@not_started
Scenario: Triggers a fail message notification with facebook content
 Given I have attempted to send a message
 When I attach the link www.facebook.com 
 Then I send a message
 Then I should have a notification
 When I click on the notifications 
 Then I should see the notification details "A message failed to send"
  
 @not_started
Scenario: Triggers a fail message notification with duplicate message
 Given I have attempted to send a message
 When I send the same message to same property again
 Then I should have a notification
 When I click on the notification  
 Then I should see the notification details "A message failed to send"

 @not_started
Scenario: Triggers a fail message with blocked content (3)
 Given I have attempted to send a message
 When I attach link with blocked content
 Then I send a message
 Then I should have a notification
 When I click on the notifications 
 Then I should see the notification details "A message failed to send"
 
 @not_started
Scenario: Triggers a failed message notification due to invalid token
 Given I have changed the password of my facebook property
 Then I have attempted to send a message
 Then I should have 2 notifications
 When I click on the notifications 
 Then I should see the notification details "A message failed to send"


