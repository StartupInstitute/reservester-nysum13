# Read about factories at https://github.com/thoughtbot/factory_girl
include ActionDispatch::TestProcess
FactoryGirl.define do
  # valid restaurant factory
  factory :restaurant, :class => 'Restaurant' do
    name "The Hindenberg"
    address "52 Alpine Ave."
    description "It'll blow you away! Hottest food on Earth!"
    phone "1-555-659-9589"
  end

  # invalid restaurant factory
  factory :invalid_restaurant, parent: :restaurant do
  	name nil
  	address nil
  	description nil
  	phone "Alo Guvnah!"
  end

  # valid image factory
  factory :image_factory, parent: :restaurant do
    image {fixture_file_upload(Rails.root.to_s + '/spec/support/jed.jpg', 'img/jpg')}
  end
end
