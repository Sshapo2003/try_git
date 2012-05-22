class Model::Page::AccountManagement::ManageAccounts < SitePrism::Page
  include Helpers::ModalHelper
  
  def manage_members
    click_on 'Members'
    Model::Page::AccountManagement::ManageMembers.new
  end
  
  def has_advanced_permissions?
    within_modal_if_required do
      manage_members.show_invites_form
      find('input#account_admin')[:disabled] == "false"
    end
  end
end