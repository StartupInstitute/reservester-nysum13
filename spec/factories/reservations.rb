require 'faker'

FactoryGirl.define do
  factory :reservation do |f|
    f.reserve_on Time.now
    f.association :user
    f.association :owner
    f.association :restaurant
  end
end