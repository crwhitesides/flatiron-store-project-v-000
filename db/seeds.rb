User.create(email: "christian@test.com", password: "please123")
User.create(email: "debbie@test.com", password: "please123")
User.create(email: "sofia@test.com", password: "please123")
User.create(email: "victoria@test.com", password: "please123")
User.create(email: "stephanie@test.com", password: "please123")
User.create(email: "bruce@test.com", password: "please123")
User.create(email: "amy@test.com", password: "please123")
User.create(email: "ray@test.com", password: "please123")
User.create(email: "alexandra@test.com", password: "please123")
User.create(email: "random_dude@test.com", password: "please123")

10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end
