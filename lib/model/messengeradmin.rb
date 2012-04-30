class Model::Messengeradmin
  def login
    Model::Page::MessengerAdmin::MessengerAdminLogin.new
  end
  def dashboard
    Model::Page::MessengerAdmin::MessengerAdminDashboard.new
  end
  def refresh_a_social_property
    Model::Page::MessengerAdmin::MessengerAdminRefreshASocialProperty.new
  end
end
