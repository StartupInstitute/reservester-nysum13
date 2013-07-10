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

require 'faker'

FactoryGirl.define do 
  factory :restaurant do |f| 
    f.name { Faker::Company.name } 
    f.description { Faker::Company.catch_phrase }
    f.street { Faker::Address.street_address(include_secondary = false) }
    f.phone "5161234321" 
    f.city { Faker::Address.city }
    f.state { Faker::Address.state }
    f.zip { Faker::Address.zip_code }
    f.open_time Time.now
    f.close_time Time.now+6.hours
    f.association :owner
    
    factory :invalid_message do
      name nil
    end
  end 
end 