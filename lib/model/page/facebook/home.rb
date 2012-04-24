class Model::Page::Facebook::Home < SitePrism::Page
  def login(email, password)
    visit('http://www.facebook.com')
    fill_in('email', :with => email)
    fill_in('pass', :with => password)
    click_on('Log in')
  end
end
