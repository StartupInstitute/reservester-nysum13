require 'spec_helper'

describe ImageUploader do
	before :each do
		@restaurant = create(:image_factory)
	end

	it 'has a valid image' do
		@restaurant.should be_valid
	end
end