class Model::Page::Facebook::Home < SitePrism::Page
  set_url 'http://www.facebook.com'
  
  delegate :login, :logout, :logged_in?, :to => :timeline
  
  def timeline
    Model::Page::Facebook::Timeline.new
  end
end
