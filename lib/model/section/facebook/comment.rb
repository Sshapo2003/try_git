class Model::Section::Facebook::Comment < SitePrism::Section
  element :body, '.commentBody'
  element :like_count, '.comment_like_button'

  def liked?
    has_like_count?
  end
end
