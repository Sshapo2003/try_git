class Helpers::BasicAuthHelper
  class << self
    def authorize(session)
      begin
        user = Helpers::Config['authentication_login']
        password = Helpers::Config['authentication_password']
      rescue
        raise "Basic auth credentials have not been configured for this environment"
      end
      ['wildfire_site_root', 'wildfire_messenger_root', 'wildfire_promotions_root', 'wildfire_page_manager_root', 'wildfire_analytics_root', 'wildfire_front_page', 'wildfire_templates_root'].each do |site|
        uri = URI.parse(Helpers::Config[site])
        path = "#{uri.scheme}://#{user}:#{password}@#{uri.host}#{uri.path}"
        Capybara.current_session.visit(path)
      end
      authorized_sessions << session.object_id
    end
    
    def authorized?(session)
      authorized_sessions.include?(session.object_id)
    end
    
    def authorized_sessions
      @authorized_sessions ||= []
    end
  end
end