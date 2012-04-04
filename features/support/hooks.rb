Before do
  if(Helpers::Config['requires_basic_auth'] && !Helpers::BasicAuthHelper.authorized?(Capybara.current_session))
    Helpers::BasicAuthHelper.authorize(Capybara.current_session)
  end
end