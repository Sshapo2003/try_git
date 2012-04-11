class Model::Section::Generic::Header < SitePrism::Section
  include Capybara::DSL
  
  element :company_name_span, "form.select_form_company_id div.multiuser_company_selector a span"
  element :company_select_button, "form.select_form_company_id a.select_button"
  element :company_selection_drop_down, "select#company_id"

  def choose_company(company_name)
    company_select_button.click
    within_company_select { click_on(company_name) }
    wait_until() { current_company_name == company_name}
  end
  
  def current_company_name
    company_name_span.text
  end
  
  private
  def within_company_select(&block)
    page.within('ol.select_button_options') { yield }
  end
end