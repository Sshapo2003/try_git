@account_management
Feature: Basic Info
  In order to ?
  As a Wildfire App user
  I want to be able to provide basic info about my company
  
  Background:
    Given I am logged in to Wildfire as a new user
    And I view "Basic Info" in Account Management
  
  # Re-implement on UITK5 once the current company can be extracted from the sidebar  
  @complete @staging
  Scenario: Verify that Company Name is populated automatically
    Then the Company Name field should contain the name of the current company
  
  @complete @staging @amtest
  Scenario: Update Company Name
    When I update my Company Name to "New Company"
    Then I should see the message "Company details updated"
    And the Company Name should be "New Company"

  @complete @staging @amtest
  Scenario: Company Name cannot be blank
    When I update my Company Name to ""
    Then I should see the message "can't be blank"
  
  @complete @staging @amtest
  Scenario: Update Company Industry
    When I update my Company Industry to "Manufacturing"
    Then I should see the message "Company details updated"
    And the Company Industry should be "Manufacturing"
  
  @complete @staging @amtest
  Scenario: Update Company Timezone
    When I update my Company Timezone to "(GMT+02:00) Helsinki"
    Then I should see the message "Company details updated"
    And the Company Timezone should be "(GMT+02:00) Helsinki"
  
  @complete @staging @amtest
  Scenario: Update Company Website URL
    When I update my Company website URL to "http://nyan.cat"
    Then I should see the message "Company details updated"
    And the Company Website URL should be "http://nyan.cat"
    
  @complete @staging @amtest
  Scenario: Display error message if the Company Website URL is invalid
    When I update my Company website URL to "this is not a valid url"
    Then I should see the message "is not a valid url"
  
  @complete @staging @amtest
  Scenario: Update Company Description
    When I update my Company Description to
    """
    Wildfire is an easy-to-use yet powerful tool to grow, engage, and monetize your audience on
    Facebook, Twitter, YouTube and LinkedIn
    """
    Then I should see the message "Company details updated"
    And the Company Description should be
    """
    Wildfire is an easy-to-use yet powerful tool to grow, engage, and monetize your audience on
    Facebook, Twitter, YouTube and LinkedIn
    """
    
  @complete @staging @amtest
  Scenario: Update Company Email
    When I update my Company Email to "myemail@somecompany.com"
    Then I should see the message "Company details updated"
    And the Company Email should be "myemail@somecompany.com"
    
  @complete @staging @amtest
  Scenario: Display error message if the Company Email is invalid
    When I update my Company Email to "invalidemailaddress"
    Then I should see the message "is not a valid email address"
    
  @complete @staging @amtest
  Scenario: Update Reply Email
    When I update my Reply Email to "myemail@somecompany.com"
    Then I should see the message "Company details updated"
    And the Reply Email should be "myemail@somecompany.com"
  
  @complete @staging @amtest
  Scenario: Remove Company Logo
    Given I have uploaded a company logo
    When I remove the company logo
    Then I should see the message "Your logo has been successfully removed"
    And I should see the default logo image
    
  @complete @staging @amtest
  Scenario Outline: Verify valid image files can be uploaded as the company logo
    When I upload a valid <file format> file as my company logo
    Then I should see the message "Company details updated"
    And I should no longer see the default logo image
    
  Examples:
    | file format |
    | jpg         |
    | jpeg        |
    | gif         |
    | png         |
    
  @not-started
  Scenario: Display flash message if invalid logo file is uploaded
  
  @not-started
  Scenario: Resize large images to approximately 300px x 100px
