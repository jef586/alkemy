# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApiController
      def index
        render json: categories, each_serializer: Categories::CategorySerializer, status: :ok
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
    end
  end
end
