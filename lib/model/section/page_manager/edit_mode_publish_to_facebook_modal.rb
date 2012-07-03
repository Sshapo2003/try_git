class Model::Section::PageManager::EditModePublishToFacebookModal < SitePrism::Section
  element :overwrite_prior_content_checkbox, 'div.override input'
  element :overwrite_prior_content_label, 'div.override label.wf_checkbox'
  element :application_select_box, 'div.app_select_wpr > div > a'
  element :update_button, 'button[value="Update"]'
  element :cancel_button, 'button[value="Cancel"]'
  element :publish_success_postit, 'div.publishing div.content div.success'
  elements :facebook_publication_name_labels, 'div.top form.fbfanpage_tab_publication_form > label'
  root_elements :application_select_box_options_links, 'body > ol li a'
  
  sections :facebook_properties, Model::Section::PageManager::PublishToFacebookModalProperty, 'li.social_page'

  def select_property property_name
    facebook_properties.select {|fp| fp.name.text.include? property_name}.first.check_checkbox
  end

  def select_application application_name
    wait_for_and_click_application_select_box(30)
    application_select_box_options_links.select {|l| l[:title].include?(application_name)}.first.click
  end

  def check_overwrite_previous_content_checkbox
    wait_for_and_click_overwrite_prior_content_label(30)
  end
end
