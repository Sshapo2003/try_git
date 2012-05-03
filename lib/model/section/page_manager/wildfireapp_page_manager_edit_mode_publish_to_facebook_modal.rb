class Model::Section::PageManager::WildfireappPageManagerEditModePublishToFacebookModal < SitePrism::Section
  element :overwrite_prior_content_checkbox, 'div.publication_override label[for="publication_override"].wf_checkbox'
  element :application_select_box, 'div.app_select_wpr a'
  element :update_button, 'button#publish_pages'

  elements :facebook_publication_name_labels, 'div.top form.fbfanpage_tab_publication_form > label'

  def select_property property_name
    for_id = facebook_publication_name_labels.select {|l| l.text.include?(property_name)}.first["for"]
    page.execute_script "$('div.top form input[id=#{for_id}]')[0].click()"
  end

  def select_application application_name
    application_select_box.click
    application_select_box_options_links = all('body > ol[data-visible="true"] li')
    application_select_box_options_links.select {|l| l.text.include?(application_name)}.first.find('a').click
  end
end
