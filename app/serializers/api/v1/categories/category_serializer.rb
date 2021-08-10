# frozen_string_literal: true

module Api
  module V1
    module Categories
      class CategorySerializer < ApplicationSerializer
        attributes :name
      end
    end
  end
end
