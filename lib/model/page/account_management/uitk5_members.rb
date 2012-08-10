class Model::Page::AccountManagement::Uitk5Members < SitePrism::Page
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  
  element :invite_new_members_button, "a:contains('Invite New Members')"
  
  def load
    raise "Not implemented"
  end
  
  def invite_page
    invite_new_members_button.click
    Model::Page::AccountManagement::Invite.new
  end
end