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


require 'faker'

FactoryGirl.define do
  factory :owner do |f|
    f.name { Faker::Name.name }
    f.email { Faker::Internet.email }
    f.password "password123"
    f.password_confirmation "password123"
  end
end