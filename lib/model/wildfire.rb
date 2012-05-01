class Model::Wildfire
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
    Model::Page::WildfireappMessenger.new
  end
  def wildfireapp_analytics
    Model::Page::WildfireappAnalytics.new
  end
  def wildfireapp_page_manager
    Model::Page::PageManager::WildfireappPageManager.new
  end
  def wildfireapp_page_manager_edit_mode
    Model::Page::PageManager::WildfireappPageManagerEditMode.new
  end
  def wildfireapp_countdown_template_edit_header
    Model::Page::WildfireappCountdownTemplateEditHeader.new
  end
  def wildfireapp_templates
    Model::Page::WildfireappTemplates.new
  end
  def account_management
    Model::Page::AccountManagement.new
  end
end
