# frozen_string_literal: true

module Admin
  class CommentarySerializer < ApplicationSerializer
    attributes :id,
               :body
  end
end
