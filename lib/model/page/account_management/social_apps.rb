class Model::Page::AccountManagement::SocialApps < SitePrism::Page
  include Helpers::ModalHelper
  
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  element :new_app_button, '#button_new_company_social_app'
  element :permission_denied_alert, ".alert:contains('You do not have access to use this feature')"
  section :default_application, Model::Section::AccountManagement::SocialApp, "tr:contains('Default Application')"
  sections :custom_applications, Model::Section::AccountManagement::SocialApp, "tr:contains('Custom Application')"
  
  def load
    return if loaded?
    sidebar.load_application(:company_settings)
    sidebar.company_settings_panel.applications.click
    wait_until { loaded? }
  end
  
  def loaded?
    has_custom_applications? || has_default_application? && has_sidebar?
  end
  
  def add_application(remote_id, secret)
    show_add_application_modal
    new_social_app.add_application(remote_id, secret)
    wait_until(60) { !has_modal? }
  end
  
  def new_social_app
    Model::Page::AccountManagement::NewSocialApp.new
  end
  
  def remove_app(app_name)
    app = custom_applications.detect { |a| a.name == app_name }
    raise "No app found with name '#{app_name}" unless app
    app.remove
  end
  
  def facebook_apps
    custom_applications.map { |a| a.name }
  end
  
  def show_add_application_modal
    new_app_button.click
  end
  
  def add_fb_page_to_app(page_name, app_name)
    wait_until { facebook_apps.include? app_name }
    app = custom_applications.detect { |a| a.name == app_name }
    app.add_page(page_name)
    wait_until { pages_for_fb_app(app_name).try(:include?, page_name) }
  end
  
  def remove_fb_page_from_app(page_name, app_name)
    wait_until { pages_for_fb_app(app_name).include? page_name }
    p = fb_pages_grouped_by_app[app_name].detect { |p| p.first('td.property a').text == page_name }
    p.first("a:contains('Remove')").click
    page.accept_alert
  end
  
  def pages_for_fb_app(app_name)
    fb_pages_grouped_by_app[app_name] and fb_pages_grouped_by_app[app_name].map { |p| p.first('td.property a').text }
  end
  
  private
  
  def fb_pages_grouped_by_app
    all('table.fb-pages tbody tr').inject({}) do |grouped_pages, row|
      if !(row[:id] =~ /fb_property/)
        grouped_pages[row.first('a.social_app').text] = []
      else
        grouped_pages[grouped_pages.keys.last] << row
      end
      grouped_pages
    end
  end
end