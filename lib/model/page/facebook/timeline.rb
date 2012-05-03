class Model::Page::Facebook::Timeline < SitePrism::Page
  section :timeline_nav_div, Model::Section::Facebook::TimelineNavDiv, 'div#timelineNavContent'

  def visit_my_timeline
    visit(Helpers::Config['facebook_page_url'])
  end

  def navigate_to_app app_name
    timeline_nav_div.navigate_to_app(app_name)
  end
end
