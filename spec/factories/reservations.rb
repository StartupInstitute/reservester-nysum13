require 'faker'

FactoryGirl.define do
  factory :reservation do |f|
    f.restaurant_id 1
    f.reserve_on Time.now
    f.user_id 1
    f.owner_id 1
  end
end