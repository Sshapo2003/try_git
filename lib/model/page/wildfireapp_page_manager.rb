class Model::Page::WildfireappPageManager < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_page_manager_root']}/"

  section :content_div, Model::Section::PageManager::WildfireappPageManagerContentDiv, 'div.body_content'

  def is_loaded?
    page.current_url.include? 'pages/states/published'
  end
end
