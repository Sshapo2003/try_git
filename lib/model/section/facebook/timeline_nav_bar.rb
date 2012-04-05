class Model::Section::Facebook::TimelineNavContent < SitePrism::Section
  sections :app_pagelets, Model::Section::Facebook::Timeline::ApplicationPagelets, 'div.modify'

  def link_by_tile_text(title_text)
    
  end
end
