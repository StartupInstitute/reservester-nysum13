require 'spec_helper'

describe Restaurant do
	it "has a valid factory" do
		FactoryGirl.create(:restaurant).should be_valid
	end
	it "is invalid without a name" do 
		FactoryGirl.build(:restaurant, name: nil).should_not be_valid
	end
	it "is invalid without an address" do
		FactoryGirl.build(:restaurant, address: nil).should_not be_valid
	end
	it "has a valid phone number" do
		FactoryGirl.build(:restaurant, phone: "Alo Guvnor").should_not be_valid
	end
end
