# frozen_string_literal: true

module Admin
  class TestimonialSerializer < ApplicationSerializer
    attributes :id,
               :name,
               :content
  end
end
