# frozen_string_literal: true

module Api
  module V1
    class CommentarySerializer < ApplicationSerializer
      attributes :id,
                 :body,
                 :post_id
    end
  end
end
