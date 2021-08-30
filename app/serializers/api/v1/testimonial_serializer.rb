# frozen_string_literal: true

module Api
  module V1
    class TestimonialSerializer < ApplicationSerializer
      attributes :id,
                 :name,
                 :content
    end
  end
end
