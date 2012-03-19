class Model::Page::Dashboard < SitePrism::Page
  set_url "#{Helpers::Config['wildfire_site_root']}/dashboard/contests/"

  section :dashboard_header, Model::Section::DashboardHeader, 'div.head'
end