@amtest @account_management
Feature: User Permissions
  In order to restrict the access of other account users
  As the Account Admin of a Wildfire Account
  I want to able to set specific permissions for other account users
  
  @complete
  Scenario Outline: Existing user with no permissions cannot access restricted functionality
    Given I am logged in to Wildfire as a user with no permissions
    Then I should not be able to <permission>

    Examples: Page Manager
    | permission             |
    | Manage Published Pages |
    | Manage Templates       |
    | Use Public Templates   |
    
    Examples: Analytics
    | permission              |
    | Manage Referral Sources |
    
    Examples: Messenger
    | permission      |
    | Post Messages   |
    | Post Comments   |
    | Delete Messages |
    
    Examples: Company Settings
    | permission                 |
    | Manage Applications        |
    | Manage Social Properties   |
    | Manage Services            |
    | Manage Locations           |
    | Manage Company Information |
    
    Examples: Promotion Builder
    | permission                  |
    | Manage Published Promotions |
    | Delete Promotions           |
    | Export Leads                |
  
  @complete
  Scenario Outline: Existing user with all permissions can access restricted functionality
    Given I am logged in to Wildfire as a user with all permissions
    Then I should be able to <permission>
    
    Examples: Page Manager
    | permission             |
    | Manage Published Pages |
    | Manage Templates       |
    | Use Public Templates   |
    
    Examples: Analytics
    | permission              |
    | Manage Referral Sources |
    
    Examples: Messenger
    | permission      |
    | Post Messages   |
    | Post Comments   |
    | Delete Messages |
    
    Examples: Company Settings
    | permission                 |
    | Manage Applications        |
    | Manage Social Properties   |
    | Manage Services            |
    | Manage Locations           |
    | Manage Company Information |
    
    Examples: Promotion Builder
    | permission                  |
    | Manage Published Promotions |
    | Delete Promotions           |
    | Export Leads                |

