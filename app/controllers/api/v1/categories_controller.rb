# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApiController
      def index
        render json: @categories, each_serializer: Categories::IndexCategorySerializer, status: :ok
      end

      def show
        # to do implement only admin privilege
        render json: @category, serializer: Categories::CategorySerializer, status: :ok
      end

      def update
        if @category.update(update_params)
          render json: @category, serializer: Categories::CategorySerializer, status: :ok
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      def create
        if @category.save
          render json: @category, serializer: Categories::CategorySerializer, status: :created
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @category.present?
          @category.destroy
        end

        head :no_content
      end

      private
        def create_params
          params.permit(:name, :description)
        end

        def update_params
          params.permit(:name, :description)
        end
    end
  end
end
