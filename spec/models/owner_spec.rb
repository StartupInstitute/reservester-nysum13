# == Schema Information
#
# Table name: owners
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#

require 'spec_helper'

describe Owner do
  
  it "has a valid factory" do
    owner = create(:owner)
    expect(owner).to be_valid
  end
  
  it "is invalid without a name" do
    owner = build(:owner, name: nil)
    expect(owner).to have(1).errors_on(:name)
  end
  
  # Why isn't this working? 
   it "is invalid without an email" do
     build(:owner, email: nil).should_not be_valid
   end
   
   it "returns true if owner has ownership over a restaurant" do
     owner = create(:owner)
     restaurant = owner.restaurants.create!(name: "Connollys")
     owner.has_ownership?(restaurant).should eq(true)
   end
   
   it "returns false if owner does not have ownership over a restaurant" do
     owner1, owner2 = create(:owner), create(:owner)
     restaurant = owner1.restaurants.create!(name: "Connollys")
     owner2.has_ownership?(restaurant).should eq(false)
   end
  
end
