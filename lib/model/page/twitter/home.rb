class Model::Page::Twitter::Home < SitePrism::Page
  elements :tweets, 'div.content .js-tweet-text'

  def visit_my_page
    visit(Helpers::Config['twitter_page_url'])
  end
end