class Model::Wildfire
  def front_page
    Model::Page::WildfireFrontPage.new
  end
  def login
    Model::Page::Login.new
  end
  def signup
    Model::Page::Signup.new
  end
  def dashboard
    Model::Page::Dashboard.new
  end
  def wildfireapp_messenger
    Model::Page::WildfireappMessenger::WildfireappMessenger.new
  end
  def wildfireapp_analytics
    Model::Page::WildfireappAnalytics.new
  end

  def page_manager
    if ENV['CONFIG'] == 'am-test'
      Model::Page::PageManager::Uitk5PageManager.new
    else
      Model::Page::PageManager::PageManager.new
    end
  end

  def page_manager_edit_mode
    Model::Page::PageManager::PageManagerEditMode.new
  end
  def wildfireapp_countdown_template_edit_header
    Model::Page::WildfireappCountdownTemplateEditHeader.new
  end
  def wildfireapp_templates
    Model::Page::WildfireappTemplates.new
  end
  def template_builder
    Model::Page::PageManager::TemplateBuilder.new
  end
  def template_editor
    Model::Page::PageManager::TemplateEditor.new
  end
  def upload_template
    Model::Page::PageManager::UploadTemplate.new
  end
  def wildfireapp_promotion_builder
    Model::Page::PromotionBuilder::WildfireappPromotionBuilder.new
  end
  def wildfireapp_monitor
    Model::Page::Monitor::WildfireappMonitor.new
  end
  def account_management
    Model::Page::AccountManagement::AccountManagement.new
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
end
