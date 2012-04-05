class Model::Section::PageManager::WildfireappPageManagerContentDiv < SitePrism::Section
  sections :pages, Model::Section::PageManager::WildfireappPageManagerContentDivPages, 'li.screenshot'

  def get_page_by_title(title)
    pages.select {|page| page.title == title}.first
  end
end
