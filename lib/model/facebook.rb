class Model::Facebook
  def timeline
    Model::Page::Facebook::Timeline.new
  end
  def countdown_application
    Model::Page::Facebook::WildfireApplications::CountdownApplication.new
  end
  def wildfire_app_page
    Model::Page::Facebook::WildfireApplications::WildfireAppPage.new
  end
end
