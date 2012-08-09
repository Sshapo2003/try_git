class Model::Section::Sidebar < SitePrism::Section
  section :switchboard_panel, Model::Section::Sidebar::Switchboard, '#panel-switchboard'
  section :applications_panel, Model::Section::Sidebar::ApplicationsPanel, '#panel-applications'
  section :company_settings_panel, Model::Section::Sidebar::CompanySettings, '#company-settings'
  
  def accounts
    switchboard_panel.accounts.map { |a| a.text.strip }
  end
  
  def companies
    switchboard_panel.companies.map { |a| a.text.strip }
  end
  
  def current_company
    applications_panel.menu_header.text.strip
  end
  
  def active_panel
    panels.detect { |p| p.active? }
  end
  
  def show_switchboard
    while !switchboard_panel.active? do active_panel.back_button.click end
  end
  
  def load_application(app)
    raise "#{app} is not a valid option, valid applications are #{applications}" unless applications.include? app
    # Currently not possible to go directly back to the app switcher from the switchboard
    raise SidebarNavigationException if active_panel == switchboard_panel
    while !applications_panel.active? do active_panel.back_button.click end
    applications_panel.send(app).click
  end
  
  private
  
  def panels
    [switchboard_panel, applications_panel, company_settings_panel]
  end
  
  def applications
    [:analytics, :pages, :messages, :promotions, :monitor, :company_settings]
  end
  
  class SidebarNavigationException < StandardError; end
end