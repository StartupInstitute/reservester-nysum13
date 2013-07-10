### Owner step definition ###

Given(/^Owner Test exists$/) do
  visit new_owner_registration_path
  fill_in 'owner_name', with:'ownername'
  fill_in 'owner_email', with:'owner@test.com'
  fill_in('owner_password', with:'Abcd1234')
  fill_in('owner_password_confirmation', with:'Abcd1234')
  click_button 'Sign up'
  page.has_content?('Welcome! You have signed up successfully.')
  click_link 'Logout'
end

When(/^Owner Test want to login$/) do
  visit new_owner_session_path
  fill_in('owner_email', with:'owner@test.com')
  fill_in('owner_password', with:'Abcd1234')
  click_button 'Sign in'
end

Then(/^Owner Test should successfully login to site$/) do
  page.has_content?('Signed in successfully.')
end
