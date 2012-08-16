class Model::Section::PageManager::Uitk5Page < SitePrism::Section
  element :name,                       'a.page-title-link'
  element :actions_drop_down,          '.dropdown-toggle'
  elements :actions_drop_down_options, '.dropdown-menu a'
  element :archive_link,               '.archive_link'
  element :unarchive_link,             '.unarchive_link'
  element :delete_link,                'a[data-method="delete"]'
  element :edit_link,                  '.edit a'

  def archive_page
    actions_drop_down.click
    sleep 1
    archive_link.click
  end

  def unarchive_page
    unarchive_link.click
  end

  def delete_page
    actions_drop_down.click
    sleep 1
    delete_link.click
    page.accept_alert
  end
end
