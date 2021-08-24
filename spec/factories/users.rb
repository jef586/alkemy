# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { "Joe" }
    last_name { "Doe" }
    email { FFaker::Internet.email }
    password { "password" }
    role
  end
end
