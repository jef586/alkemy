# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApiController
      include Paginable

      def index
        render json: set_posts, meta: pagination_fields(set_posts), each_serializer: PostSerializer, status: :ok
      end

      def show
        render json: @post, serializer: PostSerializer, status: :ok
      end

      private
        def set_posts
          fetch_posts
        end

        def fetch_posts
          posts = @posts
          posts = posts.page(page).per_page(page_size) if page
          posts
        end
    end
  end
end
