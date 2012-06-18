class Model::Section::PageManager::EditTemplate::TagsForm  < SitePrism::Section
  element :tags_input_field, 'input.default'
  element :save_and_continue_button, "button[value='Save & Continue']"
  element :chosen_tags, '.chzn-choices'
  elements :tags_select_list, 'ul.chzn-results li'

  def choose_tag tag
    tags_input_field.set tag
    wait_for_tags_select_list
    tags_select_list.select {|t| t.text.include? tag}.first.click
    wait_for_ajax
    save
  end

  def save
    save_and_continue_button.click
    wait_for_ajax
  end

  def tags
    chosen_tags.text
  end
end
