class Model::Page::PromotionBuilder::Entries < SitePrism::Page
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  
  element :export_button, "a:contains('Export Data')"
end