class Model::Facebook
  def timeline
    Model::Page::Facebook::Timeline.new
  end
  def countdown_application
    Model::Page::Facebook::WildfireApplications::CountdownApplication.new
  end
  def home
    Model::Page::Facebook::Home.new
  end
end
