class Model::Section::PageManager::WildfireappPageManagerContentDivPages < SitePrism::Section
  element :title_div, "div.title"
  element :edit_link, "div.edit a span"

  def title
    title_div.text 
  end
end
