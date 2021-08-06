# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApiController
      before_action :set_category, only: %i[destroy]
      def index
      end
      def show
      end
      def update
      end
      def create
      end
      def destroy
        if @category.present?
          @category.destroy
        else
          render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private
        def set_category
          @category = Category.find(params[:id])
        end
    end
  end
end
