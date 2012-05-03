class Model::Section::WildfireappTemplatesTemplate < SitePrism::Section
  element :details, 'div.details' # Capybara: When calling .text on this, it returns blank
  element :title, 'div.details h2' # Capybara: When calling .text on this, it returns blank
  element :author, 'p.author' # Capybara: When calling .text on this, it returns blank
  element :start_button, 'a.start-button'
end
