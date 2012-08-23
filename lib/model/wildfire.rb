class Model::Wildfire
  def front_page
    Model::Page::WildfireFrontPage.new
  end
  def dashboard
    Model::Page::Dashboard.new
  end
  def login
    Model::Page::AccountManagement::Login.new
  end
  def account_management
    Model::Page::AccountManagement::AccountManagement.new
  end
  def your_properties
    Model::Page::AccountManagement::YourProperties.new
  end
  def signup
    account_management.signup
  end
  def wildfireapp_messenger
    Model::Page::WildfireappMessenger::WildfireappMessenger.new
  end
  def wildfireapp_analytics
    Model::Page::WildfireappAnalytics.new
  end
  alias :analytics :wildfireapp_analytics
  def page_manager
    Model::Page::PageManager::PageManager.new
  end
  def template_builder
    Model::Page::PageManager::TemplateBuilder.new
  end
  def template_content_editor
    Model::Page::PageManager::TemplateEditor.new
  end
  def upload_template
    Model::Page::PageManager::UploadTemplate.new
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
  def wildfireapp_promotion_builder
    Model::Page::PromotionBuilder::WildfireappPromotionBuilder.new
  end
  def wildfireapp_monitor
    Model::Page::Monitor::WildfireappMonitor.new
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
end
