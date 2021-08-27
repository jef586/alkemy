# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone_number { "12345678" }
  end
end
