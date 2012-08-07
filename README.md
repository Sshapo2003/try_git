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

## USAGE

To run tests using capybara on your own machine:

 *   rake cuke:productioncomplete # runs tests tagged with @complete
 *   rake cuke:productionwip # runs tests tagged with @wip
 *   rake cuke:productionfailing # runs tests tagged with @failing

To run the tests on different environment use the following options:

 *   rake cuke:amtestcomplete # runs tests tagged with @complete on the AM-TEST environment
 *   rake cuke:stagingcomplete # runs tests tagged with @complete on the STAGING environment
 *   rake cuke:amtestwip # runs tests tagged with @wip on the AM-TEST environment
 *   rake cuke:amtestfailing # runs tests tagged with @failing on the AM-TEST environment
 *   etc.

All Environment/Tag configurations:

 * See the cucumber.yml file for a complete list of available rake configurations

By default the tests will be with Firefox. To run the tests on different environment use the following options:

 *   rake cuke:<your-task> BROWSER=chrome # Chrome
 *   rake cuke:<your-task> BROWSER=<your-browser> # other tasks defined in the capybara_drivers.rb file

## RERUNNING FAILING TESTS

You may find that, occasionally, a test will fail for reasons outside our control (network issues, browser crashes etc.). In order to rerun only tests which failed in a previous run, use one of the following commands:

AM-TEST

* cucumber @features.txt CONFIG=am-test

STAGING

* cucumber @features.txt CONFIG=staging

PRODUCTION

 * cucumber @features.txt CONFIG=live

## BEST PRACTICES

 When it's not possible to carry out an action via the standard Capybara methods and javascript/jquery are required (i.e. page.execute_script or page.evaluate.evaluate_script) then please be sure to comment with the reason. e.g. 'Cannot interact with element until mouse-over occurs'

Avoid usage of 'sleep' method. If you need to wait for an asynchronous action to complete then use one of the following strategies.

* Use the site_prism 'wait_for_xxx' method. See => https://github.com/natritmeyer/site_prism
* Use the Timeout#timeout method or Timeout#timeout_and_raise methods to keep polling for the state which you expect. e.g. Timeout.timeout(30) { sleep 0.1 while @facebook.wildfire_app_page.asynchronous_messages_panel.contains_message('Hi everyone')? == false }

## FAQ's
Q: How do I run tests on Chrome?
A: If you want to run tests in chrome you need to install chrome driver

 * Install homebrew => see https://github.com/mxcl/homebrew/wiki/installation
 * brew install chromedriver

Q: How do I find out how long each individual step takes to run?
A: You can add TIMINGS=true when running your rake task. Example:
 * rake cuke:productioncomplete TIMINGS=true

