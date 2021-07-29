# Fake data to testing purposes

administrator = Role.create(nombre: "Administrator")
client = Role.create(nombre: "Client")
visitor = Role.create(nombre: "Visitor")

User.create(first_name: "Name", last_name: "LastName", email: "test@gtesting.com", password: "123456", rol: administrator)

5.times do
    user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "client", rol: client)
    New.create(title: Faker::Book.title, content: Faker::Lorem.paragraph, user: user)
end

p "#{User.count} created users"
p "#{Rol.count} created roles"
p "#{New.count} created news"