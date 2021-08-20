# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApiController
      def index
      end

      def show
        render json: @post, serializer: PostSerializer, status: :ok
      end
    end
  end
end
