# Tests for WildfireApp

## PREREQUISITES

 * ruby, rubygems, bundler
 * run `script/bootstrap` (which essentially just runs bundle)

If you want to run tests in chrome you need to install chrome driver

 * Install homebrew => see https://github.com/mxcl/homebrew/wiki/installation
 * brew install chromedriver

## USAGE

To run tests locally using capybara on your own machine:

 *   rake cuke:wip # runs tests tagged with @wip
 *   rake cuke:complete # runs tests tagged with @complete
 *   rake cuke:failing # runs tests tagged with @failing

By default the tests will be run on the Production environment. To run tests on different environment use the following options:

 *   rake cuke:stagingwip # runs tests tagged with @wip on the STAGING environment

All Environment/Tag configurations:

 * productionwip
 * productioncomplete
 * productionfailing
 * stagingwip
 * stagingcomplete
 * stagingfailing
 * amtestwip
 * amtestcomplete
 * amtestfailing

To run tests on SauceLabs (PENDING):

 *   rake cuke:wip CONFIG=sauce # runs tests tagged with @wip
 *   rake cuke:complete CONFIG=sauce # runs tests tagged with @complete

## NOTES

