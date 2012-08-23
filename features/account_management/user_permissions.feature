@am-test
Feature: User Permissions
  In order to restrict the access of other account users
  As the Account Admin of a Wildfire Account
  I want to able to set specific permissions for other account users
  
  Background:
  
  @complete
  Scenario Outline: Existing user with Analytics permissions can access Analytics functionality
    Given I am logged in to Wildfire as a user with Analytics permissions
    Then I should be able to <permission>
    
    Examples:
    | permission              |
#    | Export Reports          | Cannot reliably verify file download functionality
    | Manage Referral Sources |
  
  @not-started  
  Scenario Outline: Existing user with Page Manager permissions can access Page Manager functionality
    Given I am logged in to Wildfire as a user with Page Manager permissions
    Then I should be able to <permission>

    Examples:
    | permission             |
    | Manage Published Pages |
    | Manage Templates       |
    | Use Public Templates   |
  
  @not-started   
  Scenario Outline: Existing user with Messenger permissions can access Messenger functionality
    Given I am logged in to Wildfire as a user with Messenger permissions
    Then I should be able to <permission>

    Examples:
    | permission      |
    | Post Messages   |
    | Post Comments   |
    | Delete Messages |
  
  @not-started 
  Scenario Outline: Existing user with Settings permissions can access Company Settings functionality
    Given I am logged in to Wildfire as a user with Settings permissions
    Then I should be able to <permission>

    Examples:
    | permission                 |
    | Manage Applications        |
    | Manage Social Properties   |
    | Manage Services            |
    | Manage Locations           |
    | Manage Company Information |

  @not-started 
  Scenario Outline: Existing user with Promotions permissions can access Promotions functionality
    Given I am logged in to Wildfire as a user with Analytics permissions
    Then I should be able to <permission>

    Examples:
    | permission                  |
    | Manage Published Promotions |
    | Delete Promotions           |
    | Export Leads                |
