class Model::Wildfire
  def login
    Model::Page::Login.new
  end
  def signup
    Model::Page::Signup.new
  end
  def dashboard
    Model::Page::Dashboard.new
  end
  def wildfireapp_messenger
    Model::Page::WildfireappMessenger.new
  end
end
