module SitePrism
  class Section
    def wait_for_ajax wait_time=Capybara.default_wait_time
      wait_until(wait_time) { page.evaluate_script("jQuery.active") == 0 }
    end
    
    private
    
    def root_element_exists?(locator)
      has_selector? locator
    end
  end
end
