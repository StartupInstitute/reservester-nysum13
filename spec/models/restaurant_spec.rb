# == Schema Information
#
# Table name: restaurants
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  street      :string(255)
#  phone       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string(255)
#  menu        :string(255)
#  city        :string(255)
#  state       :string(255)
#  zip         :string(255)
#  owner_id    :integer
#  open_time   :time
#  close_time  :time
#  table_qty   :integer
#

require 'spec_helper'


describe Restaurant do
  
  it "has a valid factory" do
    FactoryGirl.create(:restaurant).should be_valid
  end
  
  it "is invalid without a name" do
    FactoryGirl.build(:restaurant, name: nil).should_not be_valid
  end
  
  it "is invalid without a 10-digit phone number" do
    FactoryGirl.build(:restaurant, phone: "15161234567").should_not be_valid
  end
  
  it "belongs to an owner" do
    FactoryGirl.build(:restaurant, owner_id: nil).should_not be_valid
  end
  
  it "returns a restaurants full address as a string" do
    restaurant = FactoryGirl.create(:restaurant, street: "7 Liberty Street", city: "New York", state: "NY", zip: "10128")
    restaurant.address.should eq("7 Liberty Street New York, NY 10128")
  end
  
  it "returns a restaurants google maps location as a url string" do
    restaurant = FactoryGirl.create(:restaurant, street: "7 Liberty Street", city: "New York", state: "NY", zip: "10128")
    restaurant.google_map.should eq("http://maps.googleapis.com/maps/api/staticmap?center=7+Liberty+Street,New+York,NY&zoom=13&size=550x400&maptype=roadmap
    &markers=label%7size:small%7Ccolor:blue%7C7+Liberty+Street,New+York,NY\&sensor=false")
  end
  
  it "returns a formated version of the restaurants phone" do
    restaurant = FactoryGirl.create(:restaurant, phone: "5161234567")
    restaurant.format_phone.should eq("(516) 123-4567")
  end
  
  it "returns true if restaurant is owned by current owner" do

  end

end
