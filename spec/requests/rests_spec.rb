require 'spec_helper'
require 'capybara/rspec'

describe "Rests" do
  before do
    @rest = Rest.create!(:name => 'Danies Vegan Awesomeness')
  end
  
  describe "GET /rests" do
    it "should display some restaurants" do
    visit rests_path
    page.should have_content "Danies Vegan Awesomeness"
    end

    it "should create a new restaurant" do
  	  visit new_rest_path
  	  fill_in 'rest_name', :with => 'Danies Chicken and Waffles'
  	  click_button 'Create Rest'
  	  current_path.should == rests_path
  	  page.should have_content 'Danies Chicken and Waffles'
	  end
  end

  describe "PUT /rests" do
    it "should edit a restaurant" do
      visit rest_path(@rest)

      click_link 'Edit'

      current_path.should == edit_rest_path(@rest)

      find_field('rest_name').value.should == 'Danies Vegan Awesomeness'
      fill_in 'rest_name', :with => 'updated rest name'
      click_button 'Update Rest'

      current_path.should == rest_path(@rest)

      page.should have_content 'updated rest name'
    end

    it "should not update an empty restaurant" do
      visit rest_path(@rest)

      click_link 'Edit'

      fill_in 'rest_name', :with => ''
      click_button 'Update Rest'

      current_path.should == edit_rest_path(@rest)
      page.should have_content "There was an error updating your restaurant."
    end
  end

  describe "DELETE /rests" do
    it "should delete the restaurant" do
      visit rest_path(@rest)

      click_link 'Delete'

      page.should have_content 'A restaurant has been deleted.'
      page.should have_no_content 'Danies Vegan Awesomeness'
      current_path.should == rests_path
    end
  end

end
