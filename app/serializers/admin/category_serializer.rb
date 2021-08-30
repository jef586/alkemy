# frozen_string_literal: true

module Admin
  class CategorySerializer < ApplicationSerializer
    attributes :id,
                :name,
                :description
  end
end
