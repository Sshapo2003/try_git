class Model::Section::Analytics::Uitk5WildfireappAnalyticsSidebar < SitePrism::Section

  element :selected_link_label, "li.selected"
  elements :unselected_links_labels, "li:not(.selected) a"
  elements :reports_links,"li a"

  def link(link_name)
    reports_links.select { |l| l.text == link_name}.first
  end
end
