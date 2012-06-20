Feature: Screen Booklet
  In order to check for layout problems on wildfireapp.com
  As a tester
  I want to be able to get screens of the entire site in a booklet format

Scenario: Get a booklet of the entire site
  Given I want the following pages in my capture list
    | Page Name | Domain   | Page URL    |
    | Login     | accounts | sso_sign_on |
    | Signup    | accounts | signup      |
  When I produce the report
  Then I should have all the pages included
  