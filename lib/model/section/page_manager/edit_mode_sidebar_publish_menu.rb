class Model::Section::PageManager::EditModeSidebarPublishMenu < SitePrism::Section
  element :publish_accordian_link, 'a'
  element :publish_to_facebook,    '.publish_fb_page'
  element :publish_to_microsite,   '.publish_microsite_page'
  element :unpublish_all_link,     'input.unpublish_all'

  def click_publish_to_facebook
    Timeout.timeout(30) do
      clicked = false
      while !clicked
        begin
          wait_for_and_click_publish_to_facebook(30)
          clicked = true
        rescue
          # sometimes get webdriver error because publish_to_facebook link not yet visible
          sleep 1
        end
      end
    end
  end
end
