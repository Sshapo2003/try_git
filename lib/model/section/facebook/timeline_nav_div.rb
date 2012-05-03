class Model::Section::Facebook::TimelineNavDiv < SitePrism::Section
  sections :app_pagelets, Model::Section::Facebook::TimelineNavDiv::ApplicationPagelets, 'div.modify'

  def navigate_to_app app_name    
    begin
      Timeout.timeout(30) do  
        while get_app_pagelet_by_name(app_name).count == 0
          sleep 1
          visit(page.driver.current_url)
        end
      end
    rescue Exception => e  
      raise "Couldnt find #{app_name} in the app pagelet links #{app_pagelets.collect {|a| a.app_name.text}}"
    end
    get_app_pagelet_by_name(app_name).first.visit_app
  end

  private

  def get_app_pagelet_by_name app_pagelet_name
    app_pagelets.select {|ap| ap.app_name.text.include?(app_pagelet_name)}
  end
end
