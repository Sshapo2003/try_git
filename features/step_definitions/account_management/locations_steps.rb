When /^I add a new company location$/ do
  @wildfire.account_management.locations.load
  @new_address = @wildfire.account_management.locations.default_address
  @wildfire.account_management.locations.add_new_location(@new_address)
end

Then /^the new location should be included in Company Locations$/ do
  # Difficult to match on states without mapping names to codes, so only match up to the City
  @wildfire.account_management.locations.load
  @wildfire.account_management.locations.should(include(@new_address), "Expected address was not found: #{@new_address.values.join(', ')}")
end