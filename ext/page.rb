module SitePrism
  class Page
    def wait_for_ajax
      wait_until { page.evaluate_script("jQuery.active") == 0 }
    end
    
    def uitk5?
      %w{am-test staging}.include? ENV['CONFIG']
    end
  end
end
