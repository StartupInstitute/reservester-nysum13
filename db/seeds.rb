# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Create Initial Owner for testing

  budi = Owner.create(email: 'budi@test.com', password: '12345678')
  rest1 = Restaurant.create(name: 'Sushiya', description: 'Japanese Restaurant', phone: '212-212-0000', owner_id: 1, street: '56th Street	', city: 'New York', state: 'NY')
  rest2 = Restaurant.create(name:'Haewoondee', description: 'Korean Restaurant', phone: '718-212-1111', owner_id: 1, street: '7532 Broadway', city: 'Elmhurst', state: 'NY')

