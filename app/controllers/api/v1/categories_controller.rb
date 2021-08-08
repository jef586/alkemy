# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApiController
      def index
      end
      def show
      end
      def update
      end
      def create
      end
      def destroy
        if category.present?
          category.destroy
        else
          render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private
        def category
          @category = Category.find(params[:id])
        end
    end
  end
end
