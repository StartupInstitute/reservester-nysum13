require "spec_helper"

describe Restaurant do
	it "should not be valid" do
		r = Restaurant.new()
		r.should_not be_valid
	end

	it "should save with attributes" do
		r = Restaurant.new(name:"Test", address:"New York", phone:"111111111", description:"Great!")
		r.should be_valid
	end
end