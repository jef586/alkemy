# frozen_string_literal: true

FactoryBot.define do
  factory :organization do
    name { "Somos Más" }
    welcome_text { "Welcome text" }
    about_us_text { "About us text" }
    address { "Lujan 345" }
    email { "somosfundacionmas@gmail.com" }
    phone { "1160112988" }
    user { User.create(first_name: "Admin", last_name: "Admin", email: "blaadmin@admin.com", password: "password", role: Role.create(name: "administrator")) }
  end
end
