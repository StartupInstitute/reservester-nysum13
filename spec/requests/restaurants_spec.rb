require 'spec_helper'

feature "Restaurant management" do
  scenario "adds a new restaurant" do
  	visit restaurants_path
  	expect {
	  	click_link 'New Restaurant'
	  	fill_in 'name', with: 'Righteous Ribs'
	  	fill_in 'description', with: 'These ribs are totally righteous dude!'
	  	fill_in 'address', with: 'The Future DUDE'
	  	fill_in 'phone', with: '1-555-987-8974'
	  	click_on 'Submit'
	  	}.to change(Restaurant, :count).by(1)
	expect(page).to have_content('Righteous Ribs')
  end
end
