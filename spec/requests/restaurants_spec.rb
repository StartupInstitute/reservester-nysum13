require 'spec_helper'

feature "Restaurant management" do
  #Test for adding a restaurant
  scenario "adds a new restaurant" do
  	visit restaurants_path
  	expect {
	  	click_link 'New Restaurant'
	  	fill_in 'name', with: 'Righteous Ribs'
	  	fill_in 'description', with: 'These ribs are totally righteous dude!'
	  	fill_in 'address', with: 'The Future DUDE'
	  	fill_in 'phone', with: '1-555-987-8974'
	  	attach_file_for_direct_upload("#{Rails.root}/spec/support/jed.jpg")
    	# upload_directly(ImageUploader.new, "Upload Image")
	  	click_on 'Submit'
	  	}.to change(Restaurant, :count).by(1)
	expect(page).to have_content('Righteous Ribs')
  end

  # Test for deleting a restaurant
  scenario "deletes an existing restaurant" do
  	create(:restaurant)
  	visit restaurants_path
  	expect{
  		click_on 'Show'
  		click_on 'Delete'
  		Capybara.using_driver :webkit do
  			page.evaluate_script('window.confirm = function() { return true; }')
  		end
  		}.to change(Restaurant, :count).by(-1)
  	expect(page).to have_content('Restaurant was successfully deleted!')
  end
end
