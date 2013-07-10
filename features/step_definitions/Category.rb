### Category Step Definitions ###

Given(/^admin at homepage$/) do
  step'owner at homepage'
end

When(/^admin create new category$/) do
  click_link'Category'
  click_link'New Category'
end

When(/^admin fill up the category info$/) do
  fill_in('category_name', with:'category A')
end

Then(/^new category should be created$/) do
  click_button'Create Category'
  page.has_content?'Category was successfully created.'
end

Given(/^the category (.*) exist$/) do |name|
  cat = Category.create(name:"category #{name}")
end

When(/^owner want to assign multiple categories$/) do
  visit restaurants_path
  click_link 'Edit'
  select'category A', from:'restaurant_category_ids'
  select'category B', from:'restaurant_category_ids'
end

Then(/^the restaurant categories should be updated$/) do
  click_button'Update Restaurant'
  page.has_content?'category A'
  page.has_content?'category B'
end
