# frozen_string_literal: true

module Admin
  module Categories
    class CategorySerializer < ApplicationSerializer
      attributes :id,
                  :name,
                  :description
    end
  end
end
