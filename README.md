# Tests for WildfireApp

## PREREQUISITES

Windows

 * Install pik => https://github.com/vertiginous/pik
 * Install bundler =>  $ gem install bundler 
 * run `script/bootstrap` (which essentially just runs bundle)

Mac

 * Install rvm => https://rvm.io/rvm/install
 * Install bundler =>  $ gem install bundler
 * run `script/bootstrap` (which essentially just runs bundle)

If you want to run tests in chrome you need to install chrome driver

 * Install homebrew => see https://github.com/mxcl/homebrew/wiki/installation
 * brew install chromedriver

## USAGE

To run tests using capybara on your own machine:

 *   rake cuke:complete # runs tests tagged with @complete
 *   rake cuke:wip # runs tests tagged with @wip
 *   rake cuke:failing # runs tests tagged with @failing

By default the tests will be run on the Production environment. To run the completed tests on different environment use the following options:

 *   rake cuke:amtestcomplete # runs tests tagged with @complete on the AM-TEST environment
 *   rake cuke:stagingcomplete # runs tests tagged with @complete on the STAGING environment

All Environment/Tag configurations:

 * See the cucumber.yml file for a complete list of available rake configurations

## BEST PRACTICES

 When it's not possible to carry out an action via the standard Capybara methods and javascript/jquery are required (i.e. page.execute_script or page.evaluate.evaluate_script) then please be sure to comment with the reason behing this. e.g. 'Cannot interact with element until mouse-over occurs'

Avoid usage of 'sleep' method. If you need to wait for an asynchronous action to complete then use one of the following stratigies.

* Use the site_prism 'wait_for_xxx' method. See => https://github.com/natritmeyer/site_prism
* Use the Timeout.timeout method to keep polling for the state which you expect. e.g. Timeout.timeout(30) { sleep 0.1 while @facebook.wildfire_app_page.displayed? == false }
