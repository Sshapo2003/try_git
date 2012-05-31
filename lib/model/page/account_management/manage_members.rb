class Model::Page::AccountManagement::ManageMembers < SitePrism::Page
  def show_invites_form
    click_on('Invite New Members')
  end
end