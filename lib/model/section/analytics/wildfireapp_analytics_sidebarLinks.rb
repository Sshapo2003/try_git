class Model::Section::Analytics::WildfireappAnalyticsSidebar::WildfireappAnalyticsSidebarLinks < SitePrism::Section
  element :url,"a"
  element :label,"span span :nth-child(5)"

  def is_selected
    return url == nil
  end
end
