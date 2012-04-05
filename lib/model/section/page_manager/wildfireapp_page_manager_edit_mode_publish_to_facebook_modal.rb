class Model::Section::PageManager::WildfireappPageManagerEditModePublishToFacebookModal < SitePrism::Section
  element :overwrite_prior_content_checkbox, 'div.publication_override label[for="publication_override"].wf_checkbox'
  element :update_button, 'button#publish_pages'
end
