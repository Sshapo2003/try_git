class Model::Page::WildfireFrontPage < SitePrism::Page
  set_url Helpers::Config['wildfire_front_page']
  
  element :signup_link, "a:contains('Sign up!')"
  element :login_link,  "a:contains('Login')"
end