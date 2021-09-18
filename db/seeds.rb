user1 = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123123", role: "Owner")
10.times do
  Flat.create(
    title: Faker::Restaurant.name,
    description: Faker::Lorem.paragraph(sentence_count: 4),
    address: Faker::Address.full_address,
    capacity: Faker::Number.between(from: 1, to: 10),
    price: Faker::Number.between(from: 50, to: 200),
    user: user1
  )
end
