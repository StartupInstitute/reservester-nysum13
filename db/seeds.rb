# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Owner table"
#Owner.delete_all
Owner.create([{email: 'kashyap.bhatt15@gmail.com', name: 'Kashyap', password: 'password1', password_confirmation: 'password1'},{email: 'kashyap.bhatt@live.com', name: 'KBhatt', password: 'password1', password_confirmation: 'password1'}])
puts "Owner seeded"
puts "==================================================================================================================="

puts "Category table"
#Category.delete_all
Category.create([{name: 'American'},{name: 'Chinese'},{name: 'Italian'},{name: 'French'},{name: 'Vegetarian'}])
puts "Category seeded"
puts "==================================================================================================================="

puts "Restaurant table"
#Restaurant.delete_all
Restaurant.create([{name: 'McDonalds', address: 'Manhattan, NY', description: 'Our Burgers are best', phone: '4449991234', owner_id: 1}])
Restaurant.create([{name: 'Subway', address: 'Wall Stret, Manhattan, NY', description: 'Eat Healthy', phone: '4459991234', owner_id: 1}])
Restaurant.create([{name: 'Wendys', address: 'Cortland Street Manhattan, NY', description: 'Wendys are the best', phone: '6449991234', owner_id: 2}])
Restaurant.create([{name: 'Papa John', address: '1 Liberty Plaza Manhattan, NY', description: 'Better than Dominos', phone: '8449991234', owner_id: 2}])
Restaurant.create([{name: 'Starbuck', address: '14th Street Manhattan, NY', description: 'I am everywhere in Manhattan and I am not really a restaurant.', phone: '9949991234', owner_id: 1}])
puts "Restaurant seeded"