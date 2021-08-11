# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApiController
      def index
        render json: categories, each_serializer: Categories::IndexCategorySerializer, status: :ok
      end

      def show
      end

      def update
        if category.update(update_parameters)
          render json: category, serializer: Categories::CategorySerializer, status: :ok
        else
          render json: category.errors, status: :unprocessable_entity
        end
      end

      def create
        category = Category.new(create_parameters)
        if category.save
          render json: category, serializer: Categories::CategorySerializer, status: :created
        else
          render json: category.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if category.present?
          category.destroy
        end

        head :no_content
      end

      private
        def category
          @category ||= Category.find(params[:id])
        end

        def categories
          @categories ||= Category.all
        end

        def create_parameters
          params.permit(:name, :description)
        end

        def update_parameters
          params.permit(:name, :description)
        end
    end
  end
end
