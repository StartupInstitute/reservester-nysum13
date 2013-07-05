FactoryGirl.define do
	factory :owner do
		name "John Smith"
		sequence(:email) {|n| "johnsmith#{n}@gmail.com"}
	    password "password"
	end
end