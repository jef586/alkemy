# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApiController
      def index
      end

      def show
        render json: @post, serializer: PostSerializer, status: :ok
      end
      
      def create
        if @post.save
          render json: @post, serializer: PostSerializer, status: :created
        else
          render json: { errors: @post.errors }, status: :unprocessable_entity
        end
      end

      def update
      end
    end
  end
end
