class Model::Section::PageManager::Uitk5Page < SitePrism::Section
  element :name, 'a.page-title-link'
  element :actions_drop_down, '.dropdown-toggle'
  element :archive_link, '.archive_link'
  element :delete_link, 'a[data-method="delete"]'

  def archive_page
    actions_drop_down.click
    sleep 1
    archive_link.click
  end

  def delete_page
    actions_drop_down.click
    sleep 1
    delete_link.click
    page.accept_alert
  end
end
