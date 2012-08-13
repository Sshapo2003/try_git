class Model::Section::PageManager::EditTemplate::CategoriesForm  < SitePrism::Section
  element :select_button, '.select_button'
  root_elements :categories_options, 'body > ol a'
  root_element :save_and_continue_button, ".categories_form button[value='Save & Continue']"
  root_element :form_in_active_state, '#wizard_categories_section.in'

  def is_visible?
    has_form_in_active_state?
  end

  def choose_category category
    # 
    # Cannot click on :select_button, '.select_button'
    # Capybara, JS, and JQuery - none work!
    #
    # select_button.click
    # wait_for_categories_options
    # categories_options.each {|o| puts o[:title]}
    # categories_options.select {|o| o[:title].include? category}.first.click
    # save
  end

  def save
    save_and_continue_button.click
    wait_for_ajax
  end
end
