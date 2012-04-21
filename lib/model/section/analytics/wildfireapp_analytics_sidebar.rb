class Model::Section::Analytics::WildfireappAnalyticsSidebar < SitePrism::Section

  element :selected_link_label, "ol li.overview > span"
  elements :unselected_links_labels, "ol li.overview > a > span"
  elements :reports_links,"ol li.overview > a"

  def link(link_name)
    reports_links.select { |l| l.text == link_name}.first
  end
end
