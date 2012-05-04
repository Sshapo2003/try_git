class Model::Page::Facebook::WildfireApplications::WildfireAppPage < SitePrism::Page
  set_url_matcher /\/app_/

  element :iframe, 'iframe'

  def iframe_body
    Timeout.timeout(30) do
      while true
        begin
          page.driver.browser.switch_to.frame iframe[:id]
          body = page.driver.body
          page.driver.browser.switch_to.default_content
          return body
        rescue Selenium::WebDriver::Error::UnknownError => e
          puts e.inspect
          sleep 1
        end
      end
    end
  end
end
