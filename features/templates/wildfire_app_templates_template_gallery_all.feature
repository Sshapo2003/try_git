@allgallerytemplates @production
Feature: Templates

  Background:
    Given I am logged in to Wildfire as the default user
    And I navigate to the wildfire app templates page

  @not_started
  Scenario Outline: Displaying of Notifications
    When I create a page from the "<Template>" template
    And I publish the template
    Then the published template should be visible on my facebook page
  
  Examples:
    | Template |
    | Drag, Drop & Share |
    | Signup to Reveal |
    | Stories with Video |
    | Stories to Sweepstakes |
    | Tile Gallery |
    | Sliding Gallery 2.0 |
    | Signup Form, Gallery and RSS |
    | Big Image + Button (New) |
    | Timeline Welcome |
    | Instagram Feed |
    | Vote This or That |
    | FB Style Sweepstakes  |
    | Featured Stories |
    | Awesome Sweepstakes |
    | Big Video and Button Ideal |
    | Signup to Gallery |
    | Spotify Music Sharing |
    | Deluxe Photo Gallery |
    | Countdown Timer |
    | Simple Signup |
    | Pinterest Board |
    | Code Red Stories |
    | Wintergreen Stories |
    | Powder Blue Stories |
    | FB Style Stories |
    | Mahogany and Midnight Stories |
    | Leather-bound Stories |
    | Click-Thru Gallery |
    | Dueling Videos |
    | Post Stories |
    | Variable Like Meter |
    | Sharing Gallery |
    | Top 10 List |
    | Signup to Video |
    | Signup To Gallery |
    | Quad Video Showcase |
    | Like Meter & Reveal |
    | Countdown to Coupon 2 (Likes) |
    | Countdown to Coupon (Likes) |
    | Big Image + 2 Buttons |
    | Custom Calendar Reveal |
    | Flash Sale |
    | Countdown to Coupon 2 (Time) |
    | Countdown to Coupon (Time) |
    | Calendar Reveal |
    | Smooth Slide |
    | Big Image, Text and Button |
    | Paypal Donation with Skins |
    | Twitter Big Image |
    | Twitter Blue |
    | Big Image, Video, and Button |
    | Dress Up |
    | Stories with Image |
    | Dueling Videos Poll |
    | Google Checkout Storefront |
    | Paypal Storefront |
    | Drag and Drop |
    | MailChimp Subscribe |
    | Drag and Drop with Stories |
    | Contact Us with Google Maps |
    | Scribd (Custom Header Only) |
    | Full-width iFrame |
    | Scribd Embed |
    | Sleek Product Gallery (5) |
    | Classic Poll |
    | Classic Blog |
    | Art Video |
    | Art Poll |
    | Art Blog |
    | Big Image |
    | Vintage Video |
    | Gallery + Poll |
    | Vintage Poll |
    | Vintage Blog |
    | Retro Video |
    | Multi-Panel Media |
    | About Us (with Skins) |
    | Retro Poll |
    | Retro Blog |
    | Grunge Video |
    | Grunge Poll |
    | Grunge Blog |
    | Dark Video |
    | Dark Poll |
    | Dark Blog |
    | Clean Poll |
    | Questions/Stories |
    | Clean Video |
    | Handbook |
    | Clean Blog |
    | RSS Light |
    | Text Light |
    | Twitter Sidebar |
    | Social YouTube Channel |
    | Restaurant Dark |
    | Restaurant Light |