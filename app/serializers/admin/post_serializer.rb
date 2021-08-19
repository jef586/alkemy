# frozen_string_literal: true

module Admin
  class PostSerializer < ApplicationSerializer
    attributes :id,
               :name,
               :content
  end
end
