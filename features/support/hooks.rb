# This hook is needed because facebook oauth does not play nicely with selenium-webdrvier and firefox.
# See http://code.google.com/p/selenium/issues/detail?id=2863 for details. We use a different firefox
# profile with less strict access to iframe contents as a workaround. Must be run before the basic auth
# hook below, to ensure that the new session also performs basic auth
Before('@firefox_facebook_profile') do
  @previous_driver = Capybara.current_driver || Capybara.default_driver
  Capybara.current_driver = :selenium_firefox_facebook if Capybara.current_driver == :selenium_firefox
end

Before do
  if(Helpers::Config['requires_basic_auth'] && !Helpers::BasicAuthHelper.authorized?(Capybara.current_session))
    Helpers::BasicAuthHelper.authorize(Capybara.current_session)
  end
  @wildfire = Model::Wildfire.new
  @messengeradmin = Model::Messengeradmin.new
  @facebook = Model::Facebook.new
  @twitter = Model::Twitter.new

  if ENV['TIMINGS'] == 'true'
    @start_time = Time.now
  end
end

After ('@firefox_facebook_profile') do
  Capybara.current_driver = @previous_driver
end

Before('@no-firefox') do |scenario|
  scenario.skip_invoke! if ENV['BROWSER'] == 'firefox'
end

Before('@no-chrome') do |scenario|
  scenario.skip_invoke! if ENV['BROWSER'] == 'chrome'
end

After do |scenario|
  if ENV['TIMINGS'] == 'true'
    $test_timings || $test_timings = {}
    @end_time = Time.now
    total_time = @end_time - @start_time
    $test_timings.merge!(scenario.to_sexp[3] => total_time)
  end
end
