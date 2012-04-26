class Model::Section::WildfireappTemplatesTemplate < SitePrism::Section
  element :details, 'div.details'
  element :title, 'div.details h2'
  element :link, '> a'
  element :author, 'p.author'
end
