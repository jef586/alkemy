# frozen_string_literal: true

module Admin
  class PostsController < ApiController
    def index
    end

    def show
      render json: @post, serializer: PostSerializer, status: :ok
    end

    def update
      if @post.update(update_params)
        render json: @post, serializer: Admin::PostSerializer, status: :ok
      else
        render json: @post.errors, status: :unprocessable_entity
      end
    end

    def create
      if @post.save
        render json: @post, serializer: PostSerializer, status: :created
      else
        render json: { errors: @post.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      if @post.present?
        @post.destroy
      end

      head :no_content
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
  end
end
