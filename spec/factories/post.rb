# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    name { "Post name" }
    content { "Post content" }
    user
    category
  end
end
