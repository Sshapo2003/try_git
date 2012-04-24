module FacebookHelper
  def facebook
    @facebook || Model::Facebook.new
  end
end
World(FacebookHelper)