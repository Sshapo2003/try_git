class Model::Section::PromotionBuilder::Campaign < SitePrism::Section
  element :name_cell, 'td:nth-of-type(1)'
  element :status_cell, 'td:nth-of-type(2)'
  element :closing_cell, 'td:nth-of-type(3)'
  element :edit_button, "a:contains('Edit')"
  element :dropdown_toggle, '.btn-primary.dropdown-toggle'
  element :manage_dropdown, ".dropdown-toggle:contains('Manage')"
  element :leads_link, "a:contains('Leads')"
  element :delete_link, "a:contains('Delete')"
  
  def name
    name_cell.text.strip
  end
  
  def status
    status_Cell.text.strip
  end
  
  def closing_date
    closing_cell.text.strip
  end
  
  def edit
    edit_button.click
  end
  
  def delete
    dropdown_toggle.click
    wait_for_delete_link
    delete_link.click
    page.accept_alert
  end
  
  def manage_leads
    manage_dropdown.click
    wait_for_leads_link
    leads_link.click
  end
end