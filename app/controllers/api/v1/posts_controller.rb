# frozen_string_literal: true

module Api
  module V1
    class PostsController < ApiController
      def index
      end

      def show
        render json: @post, serializer: PostSerializer, status: :ok
      end

      def update
        if @post.update(update_params)
          render json: @post, serializer: Categories::PostSerializer, status: :ok
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end
<<<<<<< HEAD

      def destroy
      end

      private
        def create_params
          params.permit(
            :name,
            :content,
            :category_id
          ).merge(user: current_user)
        end
        def update_params
          params.permit(:name, :content, :category_id)
        end
=======
>>>>>>> dev
    end
  end
end
