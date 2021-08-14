# frozen_string_literal: true

module Api
  module V1
    class NewsController < ApiController
      def index
      end

      def show
        render json: @new, serializer: NewSerializer, status: :ok
      end

      def create
        if @new.save
          render json: @new, serializer: NewSerializer, status: :created
        else
          render json: { errors: @new.errors }, status: :unprocessable_entity
        end
      end

      def update
      end

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
    end
  end
end
