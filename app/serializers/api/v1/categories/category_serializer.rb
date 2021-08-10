# frozen_string_literal: true

module Api
  module V1
    module Categories
      class CategorySerializer < ApplicationSerializer
        attributes :id,
                   :name,
                   :description,
                   :image_url
      end
    end
  end
end