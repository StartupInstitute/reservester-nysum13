require "spec_helper"

describe Restaurant do

	it "should not be valid" do
		r = Restaurant.new()
		r.should_not be_valid
	end

	context "with incomplete attributes" do

		it "should not save without name" do
			r = Restaurant.new(name: "", address:"New York", phone:"111111111", description:"Great!")
			r.should_not be_valid
		end

		it "should not save without address" do
			r = Restaurant.new(name:"Test", address:"", phone:"111111111", description:"Great!")
			r.should_not be_valid
		end

		it "should not save without phone" do
			r = Restaurant.new(name:"Test", address:"New York", phone:"", description:"Great!")
			r.should_not be_valid
		end

		it "should not save without description" do
			r = Restaurant.new(name:"Test", address:"New York", phone:"111111111", description:"")
			r.should_not be_valid
		end
	end
end