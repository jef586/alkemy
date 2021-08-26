# frozen_string_literal: true

FactoryBot.define do
  factory :testimonial do
    name { "Testimonial name" }
    content { "Testimonial content" }
    user
  end
end
