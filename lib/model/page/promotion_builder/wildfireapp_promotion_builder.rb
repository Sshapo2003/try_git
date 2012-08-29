class Model::Page::PromotionBuilder::WildfireappPromotionBuilder < SitePrism::Page
  section :sidebar, Model::Section::Sidebar, '#sidebar'
  
  set_url "#{Helpers::Config['wildfire_promotions_root']}/"
  set_url_matcher /dashboard\/contests/
  
  def active?
    using_wait_time(1) { page.has_no_content?('This product is locked') }
  end
  
  def manage_campaigns
    Model::Page::PromotionBuilder::ManageCampaigns.new
  end
  
  def entries
    Model::Page::PromotionBuilder::Entries.new
  end
  
  def export
    Model::Page::PromotionBuilder::Export.new
  end
end