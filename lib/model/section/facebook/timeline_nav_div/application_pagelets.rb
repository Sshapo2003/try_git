class Model::Section::Facebook::TimelineNavDiv::ApplicationPagelets < SitePrism::Section
  element :app_name, 'div.title span.text'
  element :app_url, 'a.tab'

  def visit_app
    visit(app_url["href"])
  end
end
