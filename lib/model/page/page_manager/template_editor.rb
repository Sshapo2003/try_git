class Model::Page::PageManager::TemplateEditor < SitePrism::Page
  element :go_back_button, 'a.go_back'
  elements :tabs, 'ol.page_templates > li > a'

  section :content_form, Model::Section::PageManager::EditTemplate::ContentForm, '.content_form'
  section :appearance_form, Model::Section::PageManager::EditTemplate::AppearanceForm, '.appearance_form'
  section :screen_shot_form, Model::Section::PageManager::EditTemplate::ScreenShotForm, '.screenshot_form'
  section :categories_form, Model::Section::PageManager::EditTemplate::CategoriesForm, '.categories_form'
  section :tags_form, Model::Section::PageManager::EditTemplate::TagsForm, '.tags_form'
  section :privacy_form, Model::Section::PageManager::EditTemplate::PrivacyForm, '.privacy_form'

  def click_tab tab_name
    case tab_name.downcase
    when 'content'
      tabs.select {|t| t.text.downcase.include? tab_name.downcase}.first.click
      content_form.wait_for_content_save_and_continue_button
    when 'screenshot'
      tabs.select {|t| t.text.downcase.include? tab_name.downcase}.first.click
      screen_shot_form.wait_for_add_image_button
    when 'categories'
      tabs.select {|t| t.text.downcase.include? tab_name.downcase}.first.click
      categories_form.wait_for_save_and_continue_button
    when 'tags'
      tabs.select {|t| t.text.downcase.include? tab_name.downcase}.first.click
      tags_form.wait_for_save_and_continue_button
    when 'privacy'
      tabs.select {|t| t.text.downcase.include? tab_name.downcase}.first.click
      privacy_form.wait_for_save_and_continue_button
    else raise "Unknown tab #{tab_name}"
    end
  end

  def set_template_name template_name
    if not content_form.visible? then click_tab 'Content' end
    content_form.set_template_name template_name
  end

  def get_template_name
    if not content_form.visible? then click_tab 'Content' end
    content_form.template_name[:value]
  end

  def set_template_description description
    if not content_form.visible? then click_tab 'Content' end
    content_form.set_template_description description
  end

  def get_template_description
    if not content_form.visible? then click_tab 'Content' end
    content_form.template_description[:value]
  end

  def set_screenshot screenshot
    if not screen_shot_form.visible? then click_tab 'Screenshot' end
    screen_shot_form.set_template_image screenshot
  end

  def has_screenshot?
    if not screen_shot_form.visible? then click_tab 'Screenshot' end
    screen_shot_form.has_screenshot?
  end

  def choose_category category
    if not categories_form.visible? then click_tab 'Categories' end
    categories_form.choose_category category
  end

  def choose_tag tag
    if not tags_form.visible? then click_tab 'Tags' end
    tags_form.choose_tag tag
  end

  def tags
    if not tags_form.visible? then click_tab 'Tags' end
    tags_form.tags
  end

  def set_privacy privacy
    if not privacy_form.visible? then click_tab 'Privacy' end
    privacy_form.set_privacy privacy
  end

  def privacy_value
    if not privacy_form.visible? then click_tab 'Privacy' end
    privacy_form.privacy_value
  end
end
