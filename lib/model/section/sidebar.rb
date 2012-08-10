class Model::Section::Sidebar < SitePrism::Section
  section :switchboard_panel, Model::Section::Sidebar::Switchboard, '#panel-switchboard'
  section :applications_panel, Model::Section::Sidebar::ApplicationsPanel, '#panel-applications'
  section :company_settings_panel, Model::Section::Sidebar::CompanySettings, '#company-settings'
  section :promotions_panel, Model::Section::Sidebar::PromotionsPanel, '#panel-promotions'
  section :messenger_panel, Model::Section::Sidebar::MessengerPanel, '#messenger-nav'
  section :analytics_panel, Model::Section::Sidebar::AnalyticsPanel, '#dashboard_nav'
  section :pages_panel, Model::Section::Sidebar::PagesPanel, '#panel-main'
  section :account_settings_panel, Model::Section::Sidebar::AccountSettingsPanel, '#account-settings'
  
  def accounts
    show_switchboard
    switchboard_panel.accounts.map { |a| a.text.strip }
  end
  
  def companies
    show_switchboard
    switchboard_panel.companies.map { |a| a.text.strip }
  end
  
  def current_company
    show_applications_panel
    applications_panel.menu_header.text.strip
  end
  
  def active_panel
    send panels.detect { |p| send("has_#{p}?".to_sym) && send(p).active? }
  end
  
  def show_switchboard
    while !switchboard_panel.active? do active_panel.back_button.click end
  end
  
  def show_applications_panel
    visit(current_url) if active_panel == switchboard_panel
    while !applications_panel.active? do active_panel.back_button.click end
  end
  
  def manage_account(account_name = accounts.first)
    show_switchboard
    switchboard_panel.manage_account(account_name)
  end
  
  def load_application(app)
    raise "#{app} is not a valid option, valid applications are #{applications}" unless applications.include? app
    visit(current_url) if active_panel == switchboard_panel
    while !applications_panel.active? do active_panel.back_button.click end
    applications_panel.send(app).click
  end
  
  def switch_company(name)
    show_switchboard
    switchboard_panel.switch_company(name)
  end
  
  private
  
  def panels
    [:switchboard_panel, :applications_panel, :company_settings_panel, :promotions_panel, :account_settings_panel, :messenger_panel, :analytics_panel, :pages_panel]
  end
  
  def applications
    [:analytics, :pages, :messages, :promotions, :monitor, :company_settings]
  end
  
  class SidebarNavigationException < StandardError; end
end