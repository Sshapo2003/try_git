class Model::Section::Sidebar::Switchboard < SitePrism::Section
  def active?
    !!(root_element['class'] =~ /active/)
  end
  
  def accounts
    within(root_element) do
      all('li').reject do |li|
        li['class'] =~ /[nav\-header|menu\-header|indent1]/ ||
        li.text.strip == 'Create New Company' ||
        li.first('a i.icon-user')
      end
    end
  end
  
  def companies
    within(root_element) do
      all('li.indent1').select { |li| li.first("a[href*='change_company']")}
    end
  end
  
  def your_profile
    all('li').detect { |li| li.first('a i.icon-user') }
  end
  
  def switch_company(name)
    companies.detect { |c| c.text.strip == name }.click
  end
  
  def manage_account(name)
    accounts.detect { |a| a.text.strip == name }.first('a').click
  end
end