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

To run tests on SauceLabs:

 *   rake cuke:wip CONFIG=sauce # runs tests tagged with @wip
 *   rake cuke:complete CONFIG=sauce # runs tests tagged with @complete

## NOTES

