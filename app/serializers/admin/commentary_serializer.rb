# frozen_string_literal: true

module Admin
  class CommentarySerializer < ApplicationSerializer
    attributes :id,
               :body,
               :post_id
  end
end
