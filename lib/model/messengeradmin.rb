class Model::Messengeradmin
  def login
    Model::Page::MessengerAdminLogin.new
  end
  def dashboard
    Model::Page::MessengerAdminDashboard.new
  end
end
