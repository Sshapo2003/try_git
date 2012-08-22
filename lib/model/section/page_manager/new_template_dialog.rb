class Model::Section::PageManager::NewTemplateDialog < SitePrism::Section
  element :header, 'h1'
  element :template_name, '#page_template_title'
  element :save_button, '.btn-primary'
end
