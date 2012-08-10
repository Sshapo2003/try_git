class Model::Page::AccountManagement::Uitk5EditSubscription < SitePrism::Page
  include Helpers::Uitk5ModalHelper
  
  def enable_application(application)
    within_modal do
      check application
      click_on 'Save'
    end
    wait_until() { !has_modal? }
  end
  
  def enable_advanced_permissions
    within_modal do
      check 'Advanced Permissions'
      click_on 'Save'
    end
    wait_until() { !has_modal? }
  end
end