class Model::Section::Dashboard::DashboardHeader < SitePrism::Section
  element :company_id, "form.select_form_company_id div.multiuser_company_selector a span"
  element :company_select_button, "form.select_form_company_id a.select_button"
  element :company_selection_drop_down, "select#company_id"

  def choose_company(company_name)

    # The elements in company_selection_drop_down are all hidden so capybara cannot click them
    # Perhaps it's possible to use jquery to make them visible again?

    # company_select_button.click
    # sleep 2
    # company_selection_drop_down.select company_name
  end
end