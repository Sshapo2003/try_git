class Model::Page::Facebook::Timeline < SitePrism::Page
  section :timeline_nav_content, Model::Section::Facebook::TimelineNavContent, 'div#timelineNavContent'
end