require_relative '../spec_helper'

describe Restaurant do
  it 'can create restaurant' do
    owner = Owner.create!(:email => 'owner@test.com', :password => '12345678')
    rest_test1 = Restaurant.new(:name => 'Restaurant Test 1', :owner_id => owner.id )
    rest_test1.save.should be_new_record
  end

end