#Restaurant Step Definitions

Given(/^user at homepage$/) do
  visit root_path
end

When(/^user create new restaurant$/) do
  visit restaurants_path
  click_link 'New Restaurant'
  #save_and_open_page
end


When(/^user fill up the restaurant info$/) do
  fill_in('restaurant_name', with:'Restaurant X')
  fill_in('restaurant_description', with:'Restaurant X Description Test')
  fill_in('restaurant_address', with:'123 Main St')
  fill_in('restaurant_phone', with:'212-212-1234')
  click_button'Create Restaurant'
  #save_and_open_page
end

Then(/^new restaurant should be created$/) do
  page.has_content?('Restaurant was successfully created.')
end

Given(/^the restaurant (.*) exist$/) do |name|
  visit new_restaurant_path
  fill_in('restaurant_name', with:"Restaurant #{name}")
  fill_in('restaurant_description', with:"Restaurant #{name} Description Test")
  fill_in('restaurant_address', with:"123 #{name} Main St")
  fill_in('restaurant_phone', with:'212-212-1234')
  click_button'Create Restaurant'
  #save_and_open_page
end

Given(/^user want to delete the restaurant A$/) do
  click_link'Back'
end

When(/^user delete restaurant A info$/) do
  click_link'Destroy'
end

Then(/^the restaurant A should be deleted$/) do
  page.has_content?
end

Given(/^user want to edit the restaurant A info$/) do
  click_link'Edit'
end

When(/^user edit restaurant A info$/) do
  fill_in('restaurant_name', with:'Restaurant A edited')
  fill_in('restaurant_description', with:'Restaurant Edited Description Test')
  fill_in('restaurant_address', with:'77 Broadway')
  fill_in('restaurant_phone', with:'212-000-0000')
  click_button'Update Restaurant'
end

Then(/^the restaurant A info should be updated$/) do
  page.has_content?('Restaurant was successfully updated.')
end

When(/^user want to see all restaurant listing$/) do
  visit restaurants_path
end

Then(/^user should see all restaurant listing$/) do
  page.has_content?('Restaurant A')
  page.has_content?('Restaurant B')
  page.has_content?('Restaurant C')
end

When(/^user want to see the restaurant A info detail$/) do
  click_link'Back'
  click_link'Show'
end

Then(/^user should see the restaurant A info$/) do
  page.has_content?('Name: Restaurant A')
end