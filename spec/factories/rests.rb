FactoryGirl.define do
  factory :rest do
    name 'Danies Vegan Awesomeness'
    descritption 'A place to eat awesomeness'
    address '123 Awesome St, NY, NY 10027'
    phone '555-1212'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end