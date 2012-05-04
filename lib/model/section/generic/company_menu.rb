class Model::Section::Generic::CompanyMenu < SitePrism::Section
  elements :accounts, 'a.optgroup span'
  
  def account_names
    accounts.collect {|a| a.text}
  end
end