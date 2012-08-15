class Model::Wildfire
  def front_page
    Model::Page::WildfireFrontPage.new
  end
  def login
    if true
      Model::Page::AccountManagement::Uitk5Login.new
    else
      Model::Page::Login.new
    end
  end
  def signup
    account_management.signup
  end
  def dashboard
    Model::Page::Dashboard.new
  end
  def wildfireapp_messenger
    if true
      Model::Page::WildfireappMessenger::Uitk5WildfireappMessenger.new
    else
      Model::Page::WildfireappMessenger::WildfireappMessenger.new
    end
  end
  def wildfireapp_analytics
    if true
      Model::Page::Uitk5WildfireappAnalytics.new
    else
      Model::Page::WildfireappAnalytics.new
    end
  end
  def page_manager
    if true
      Model::Page::PageManager::Uitk5PageManager.new
    else
      Model::Page::PageManager::PageManager.new
    end
  end
  def page_manager_edit_mode
    if true
      Model::Page::PageManager::Uitk5PageManagerEditMode.new
    else
      Model::Page::PageManager::PageManagerEditMode.new
    end
  end
  def wildfireapp_countdown_template_edit_header
    Model::Page::WildfireappCountdownTemplateEditHeader.new
  end
  def wildfireapp_templates
    Model::Page::WildfireappTemplates.new
  end
  def template_builder
    if true
      Model::Page::PageManager::Uitk5TemplateBuilder.new
    else
      Model::Page::PageManager::TemplateBuilder.new
    end
  end
  def template_content_editor
    if true
      Model::Page::PageManager::Uitk5TemplateEditor.new
    else
      Model::Page::PageManager::TemplateEditor.new
    end
  end
  def upload_template
    if true
      Model::Page::PageManager::Uitk5UploadTemplate.new
    else
      Model::Page::PageManager::UploadTemplate.new
    end
  end
  def wildfireapp_promotion_builder
    Model::Page::PromotionBuilder::WildfireappPromotionBuilder.new
  end
  def wildfireapp_monitor
    Model::Page::Monitor::WildfireappMonitor.new
  end
  def account_management
    uitk5? ? Model::Page::AccountManagement::Uitk5AccountManagement.new : Model::Page::AccountManagement::AccountManagement.new
  end
  def your_properties
    Model::Page::AccountManagement::YourProperties.new
  end
  def monitor
    Model::Page::Monitor::WildfireappMonitor.new
  end
  def track_your_competitors
    Model::Page::Monitor::TrackYourCompetitors.new
  end
  def comparison
    Model::Page::Monitor::Comparison.new
  end
  
  def uitk5?
    %w{am-test staging}.include? ENV['CONFIG']
  end
end
