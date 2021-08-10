# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApiController
      def index
      end

      def show
        # to do implement only admin privilege
        render json: category, serializer: Categories::CategorySerializer, status: :ok
      end

      def update
      end
      def create
      end
      def destroy
        if category.present?
          category.destroy
        end

        head :no_content
      end

      private
        def category
          @category = Category.find(params[:id])
        end
    end
  end
end
