# == Schema Information
#
# Table name: reservations
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  reserve_on    :datetime
#  user_id       :integer
#  owner_id      :integer
#

require 'spec_helper'

describe Reservation do
  it "has a valid factory" do
    reservation = FactoryGirl.create(:reservation)
    expect(reservation).to be_valid
  end
  
  it "belongs to a user" do
    reservation = FactoryGirl.build(:reservation, user_id: nil)
    expect(reservation).to have(1).errors_on(:user_id)
  end
  
  it "belongs to an owner" do
    reservation = FactoryGirl.build(:reservation, owner_id: nil)
    expect(reservation).to have(1).errors_on(:owner_id)
  end
  
  it "belongs to a restaurant" do
    reservation = FactoryGirl.build(:reservation, restaurant_id: nil)
    expect(reservation).to have(1).errors_on(:restaurant_id)
  end
  
  it "returns reservations booked within a specific hour" do
    reservation1 = FactoryGirl.create(:reservation)
    reservation2 = FactoryGirl.create(:reservation)
    reservation3 = FactoryGirl.build(:reservation, reserve_on: Time.now-1.day)
    expect(Reservation.during(Time.now)).to eq([reservation1, reservation2])
  end
  
  it "should not be overbooked"
end
