# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApiController
      def index
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

        def update_parameters
          params.require(:category).permit(:name, :description)
        end
    end
  end
end
