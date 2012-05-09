class Model::Page::PromotionBuilder::WildfireappPromotionBuilder < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_promotions_root']}/"
  set_url_matcher /dashboard\/contests/
  
  def active?
    using_wait_time(1) { page.has_no_content?('This product is locked') }
  end
end