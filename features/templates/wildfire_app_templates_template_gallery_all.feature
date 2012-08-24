@gallery @production
Feature: Templates

  Background:
    Given I am logged in to Wildfire as the default user
    And I navigate to the wildfire app templates page

  @complete
  Scenario: Available Templates
    Then the following templates should be available
    """
    Voting Tile Gallery
    Big Image + 2 Buttons
    Drag, Drop & Share (Facebook Image)
    Drag, Drop & Share (Profile Image)
    Signup to Reveal
    Stories with Video
    Stories to Sweepstakes
    Big Image + Button
    Timeline Welcome
    Tile Gallery 2.0
    Sliding Gallery 2.0
    Signup Form, Gallery and RSS
    Stories
    Instagram Feed
    Vote This or That
    FB Style Sweepstakes
    Featured Stories
    Awesome Sweepstakes
    Big Video and Button Ideal
    Signup to Gallery
    Spotify Music Sharing
    Deluxe Photo Gallery
    Simple Signup
    Pinterest Board
    Dueling Videos
    Post Stories
    Variable Like Meter
    Sharing Gallery
    Top 10 List
    Signup to Video
    Signup To Gallery
    Quad Video Showcase
    Like Meter & Reveal
    Countdown Timer
    Countdown to Coupon 2 (Likes)
    Countdown to Coupon (Likes)
    Custom Calendar Reveal
    Flash Sale
    Countdown to Coupon 2 (Time)
    Countdown to Coupon (Time)
    Calendar Reveal
    Smooth Slide
    Big Image, Text and Button
    Paypal Donation with Skins
    Twitter Big Image
    Twitter Blue
    Big Image, Video, and Button
    Stories with Image
    Dueling Videos Poll
    Google Wallet Storefront
    Paypal Storefront
    Drag and Drop
    MailChimp Subscribe
    Drag and Drop with Stories
    Contact Us with Google Maps
    Scribd (Custom Header Only)
    Full-width iFrame
    Scribd Embed
    Sleek Product Gallery (5)
    Classic Poll
    Classic Blog
    Art Video
    Art Poll
    Art Blog
    Big Image
    Vintage Video
    Gallery + Poll
    Vintage Poll
    Vintage Blog
    Retro Video
    Multi-Panel Media
    About Us (with Skins)
    Retro Poll
    Retro Blog
    Grunge Video
    Grunge Poll
    Grunge Blog
    Dark Video
    Dark Poll
    Dark Blog
    Clean Poll
    Questions/Stories
    Clean Video
    Handbook
    Clean Blog
    RSS Light
    Text Light
    Twitter Sidebar
    Social YouTube Channel
    Restaurant Dark
    Restaurant Light
    """
  