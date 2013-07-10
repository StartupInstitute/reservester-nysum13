### Restaurant Step Definitions ###

Given(/^owner at homepage$/) do
  step'Owner Test exists'
  step'Owner Test want to login'
  visit root_path
end

When(/^owner create new restaurant$/) do
  visit restaurants_path
  click_link 'New Restaurant'
end


When(/^owner fill up the restaurant info$/) do
  fill_in('restaurant_name', with:'Restaurant X')
  fill_in('restaurant_description', with:'Restaurant X Description Test')
  fill_in('restaurant_street', with:'123 Main St')
  fill_in('restaurant_city', with:'New York')
  fill_in('restaurant_state', with:'NY')
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
  fill_in('restaurant_street', with:"123 #{name} Broadway")
  fill_in('restaurant_city', with:'New York')
  fill_in('restaurant_state', with:'NY')
  fill_in('restaurant_phone', with:'212-212-1234')
  click_button'Create Restaurant'
end

Given(/^owner want to delete the restaurant A$/) do
  click_link'Back'
end

When(/^owner delete restaurant A info$/) do
  click_link'Destroy'
end

Then(/^the restaurant A should be deleted$/) do
  page.has_content?
end

Given(/^owner want to edit the restaurant A info$/) do
  click_link'Edit'
end

When(/^owner edit restaurant A info$/) do
  fill_in('restaurant_name', with:'Restaurant A edited')
  fill_in('restaurant_description', with:'Restaurant Edited Description Test')
  fill_in('restaurant_street', with:'77 Broadway')
  fill_in('restaurant_phone', with:'212-000-0000')
  click_button'Update Restaurant'
end

Then(/^the restaurant A info should be updated$/) do
  page.has_content?('Restaurant was successfully updated.')
end

When(/^owner want to see all restaurant listing$/) do
  visit restaurants_path
end

Then(/^owner should see all restaurant listing$/) do
  page.has_content?('Restaurant A')
  page.has_content?('Restaurant B')
  page.has_content?('Restaurant C')
end

When(/^owner want to see the restaurant A info detail$/) do
  click_link'Back'
  click_link'Show'
end

Then(/^owner should see the restaurant A info$/) do
  page.has_content?('Name: Restaurant A')
end