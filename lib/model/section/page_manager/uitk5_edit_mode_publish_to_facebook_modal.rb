class Model::Section::PageManager::Uitk5EditModePublishToFacebookModal < SitePrism::Section
  element :overwrite_prior_content_checkbox, '[name="override"]'
  element :application_select_box, '#publication_job_social_app_id'
  element :update_button, '.publish_button'
  element :cancel_button, '.modal-footer .new_publication_job [data-dismiss="modal"]'
  element :publish_success_postit, '.alert-success'
  elements :facebook_publication_name_labels, '.social_page span'
  root_elements :application_select_box_options_links, 'body > ol li a'
  
  sections :facebook_properties, Model::Section::PageManager::Uitk5PublishToFacebookModalProperty, 'li.social_page'

  def select_property property_name
    facebook_properties.select {|fp| fp.name.text.include? property_name}.first.check_checkbox
  end

  def select_application application_name
    wait_for_and_click_application_select_box(30)
    application_select_box_options_links.select {|l| l[:title].include?(application_name)}.first.click
  end

  def check_overwrite_previous_content_checkbox
    wait_for_and_click_overwrite_prior_content_checkbox(30)
  end
end
