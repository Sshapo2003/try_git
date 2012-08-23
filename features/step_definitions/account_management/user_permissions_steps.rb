include Helpers::CurrentUserHelper
Then /^I should be able to Export Reports$/ do
  pending "Cannot reliably verify this functionality without being able to interact with the browsers file download confirmation"
  # There a proably a number of hacky solutions that could be implemented here but I would rather avoid these.
  # I do not believe that checking for the absence of the tooltip is sufficient to verify this behaviour
end

Then /^I should be able to Manage Referral Sources$/ do
  current_user.should be_able_to_create_referral_source
end