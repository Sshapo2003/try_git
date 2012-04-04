class Model::Section::AccountManagement::Sidebar < SitePrism::Section
  def navigate_to(section)
    Capybara.current_session.click_on(section)
  end
end
