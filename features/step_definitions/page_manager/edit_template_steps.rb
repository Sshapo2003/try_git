Given /^I edit the templates content$/ do
  Helpers::PageManagerHelper.edit_default_content @template_name
end

When /^I edit the template with the following content$/ do |template_content|
  @template_content = template_content

  @template_content.rows_hash["Template Name"] = @template_content.rows_hash["Template Name"].concat(String.random)
  @template_name = @template_content.rows_hash["Template Name"]

  @template_content.rows_hash.each do |field, value|
    case field
    when "Template Name" then Helpers::PageManagerEditTemplateHelper.update_title value
    when "Template Description" then Helpers::PageManagerEditTemplateHelper.update_template_description value
    when "Screenshot" then Helpers::PageManagerEditTemplateHelper.update_screenshot value
    when "Categories" then Helpers::PageManagerEditTemplateHelper.choose_category value
    when "Tags" then Helpers::PageManagerEditTemplateHelper.choose_tag value
    when "Privacy" then Helpers::PageManagerEditTemplateHelper.set_privacy value
    else raise "Unknown field: #{field}"
    end
  end

  Helpers::PageManagerEditTemplateHelper.go_back
end

Then /^the updates to the template content should have been applied$/ do
  @template_content.rows_hash.each do |field, value|
    case field
    when "Template Name" then Helpers::PageManagerEditTemplateHelper.get_title.should == value
    when "Template Description" then Helpers::PageManagerEditTemplateHelper.get_template_description.should == value
    when "Screenshot" then Helpers::PageManagerEditTemplateHelper.has_screenshot?.should be_true, 'Expected at least one screenshot'
    when "Categories"
    when "Tags" then Helpers::PageManagerEditTemplateHelper.tags.should include value
    when "Privacy" then Helpers::PageManagerEditTemplateHelper.privacy_value.should include value
    else raise "Unknown field: #{field}"
    end
  end
end