class Model::Section::Facebook::TimelineNavDiv < SitePrism::Section
  sections :app_pagelets, Model::Section::Facebook::TimelineNavDiv::ApplicationPagelets, 'div.modify'

  def navigate_to_app app_name    
    visit_app_pagelet app_name
  end

  private

  def visit_app_pagelet app_name
    msg = "Couldnt find #{app_name} in the app pagelet links #{app_pagelets.collect {|a| a.app_name.text}}"
    Timeout.timeout_and_raise(30, msg) do
      while get_app_pagelet_by_name(app_name).count == 0
        sleep 2
        visit(page.driver.current_url)
      end
    end
    get_app_pagelet_by_name(app_name).first.visit_app
  end

  def get_app_pagelet_by_name app_pagelet_name
    app_pagelets.select {|ap| ap.app_name.text.include?(app_pagelet_name)}
  end
end
