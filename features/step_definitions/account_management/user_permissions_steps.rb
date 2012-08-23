include Helpers::CurrentUserHelper

Then /^I should be able to Export Reports$/ do
  pending "Cannot reliably verify this functionality without being able to interact with the browsers file download confirmation"
  # There a proably a number of hacky solutions that could be implemented here but I would rather avoid these.
  # I do not believe that checking for the absence of the tooltip is sufficient to verify this behaviour
end

Then /^I (should|should not) be able to Manage Referral Sources$/ do |expectation|
  current_user.send(expectation.gsub(' ', '_').to_sym, be_able_to_create_referral_sources)
end

Then /^I (should|should not) be able to Manage Published Pages$/ do |expectation|
  current_user.send(expectation.gsub(' ', '_').to_sym, be_able_to_manage_published_pages)
end

Then /^I (should|should not) be able to Manage Templates$/ do |expectation|
  current_user.send(expectation.gsub(' ', '_').to_sym, be_able_to_manage_templates)
end

Then /^I (should|should not) be able to Use Public Templates$/ do |expectation|
  current_user.send(expectation.gsub(' ', '_').to_sym, be_able_to_use_public_templates)
end

Then /^I (should|should not) be able to Post Messages$/ do |expectation|
  current_user.send(expectation.gsub(' ', '_').to_sym, be_able_to_post_messages)
end

Then /^I (should|should not) be able to Post Comments$/ do |expectation|
  current_user.send(expectation.gsub(' ', '_').to_sym, be_able_to_post_comments)
end

Then /^I (should|should not) be able to Delete Messages$/ do |expectation|
  current_user.send(expectation.gsub(' ', '_').to_sym, be_able_to_delete_messages)
end