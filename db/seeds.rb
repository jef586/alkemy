# Fake data to testing purposes

# Users instances 

administrator = Role.create(name: "Administrator")
client = Role.create(name: "Client")
visitor = Role.create(name: "Visitor")

10.times do
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "123456", role: administrator)
end

10.times do
    user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password_digest: "client", role: client)
    New.create(name: Faker::Book.title, content: Faker::Lorem.paragraph, user: user)
end

p "#{User.count} created users"
p "#{Role.count} created roles"
p "#{New.count} created news"