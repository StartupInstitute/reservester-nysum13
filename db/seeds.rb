  # Adding default owner
  budi = Owner.create(email: 'budi@test.com', password: '12345678')

  # Adding categories
  cat1 = Category.create(name: 'American Food')
  cat2 = Category.create(name: 'Spanish Food')
  cat3 = Category.create(name: 'Japanese Food')
  cat4 = Category.create(name: 'Korean Food')
  cat5 = Category.create(name: 'Thailand Food')
  cat6 = Category.create(name: 'Italian Food')
  cat7 = Category.create(name: 'Grill and BBQ')
  cat8 = Category.create(name: 'Vegetarian Food')
  cat9 = Category.create(name: 'Chinese Food')
  cat10 = Category.create(name: 'European Food')

  # Adding restaurant
  rest1 = Restaurant.create(name: 'Sushi Delight', owner_id: 1, street: '28 56th Street', city: 'New York', state: 'NY', category_ids: [3])
  rest2 = Restaurant.create(name: 'Kim Bob', owner_id: 1, street: '307 16th Street', city: 'New York', state: 'NY',  category_ids: [4])
  rest3 = Restaurant.create(name: 'Burger Wave', owner_id: 1, street: 'W5 34th Street', city: 'New York', state: 'NY', category_ids: [1])
  rest4 = Restaurant.create(name: 'May Thai', owner_id: 1, street: '46-06 156 Street', city: 'Flushing', state: 'NY', category_ids: [5])
  rest5 = Restaurant.create(name: 'Les Miserable', owner_id: 1, street: '71-48 Austin Street', city: 'Forest Hills', state: 'NY', category_ids: [6])
