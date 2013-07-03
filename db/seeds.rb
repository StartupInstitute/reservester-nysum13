# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

owner1 = Owner.new(:name => 'Test Owner1', :email => 'egm0921@gmail.com', :password => 'test123')

owner1_restaurant_list = [
	["Black Iron Burger", "212-677-6067", "540 E 5th St New York, NY 10009", "Great burger and bar in the East Village. Iron Horse is their signature burger."],
	["DiFara Pizza", "718-345-6895", "1424 Avenue J Brooklyn NY 11230", "Best Pizza in NYC. Same guy makes every single pie for 50 years. Long wait times, but well worth it. Try the square pie!"]
]

owner1_restaurant_list.each do |name, number, address, description|
	owner1.restaurants.create(name: name, number: number, address: address, description: description)
end

owner2 = Owner.new(:name => 'Test Owner2', :email => 'emurphh@gmail.com', :password => 'test123')

owner2_restaurant_list = [
	["Luz Restaurant", "718-246-4000", "177 Vanderbilt Ave Brooklyn NY 11205", "Nuevo Latino dishes sporting “interesting flavor combos” team up with “great” cocktails to deliver “reasonably priced” good times at this Fort Greene find; granted, it’s “slightly out of the way”, but fans say it’s “worth the trip” for a “zesty” meal in “cool”, “unpretentious” environs."],
	["Baguetteaboudit", "718-622-8333", "270 Vanderbilt Avenue Fort Greene, Brooklyn ", "Baguetteaboudit is a Brooklyn-based bakery/cafe offering a wide array of baked goods, espresso and coffee bar selections, plus a mix of both French and American comfort foods."]
]

owner2_restaurant_list.each do |name, number, address, description|
	owner2.restaurants.create(name: name, number: number, address: address, description: description)
end