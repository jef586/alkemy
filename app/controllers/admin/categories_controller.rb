# frozen_string_literal: true


module Admin
  class CategoriesController < ApiController
    def index
      render json: set_categories, each_serializer: Admin::CategorySerializer, status: :ok
    end

    def show
      render json: @category, serializer: Admin::CategorySerializer, status: :ok
    end

    def update
      if @category.update(update_params)
        render json: @category, serializer: Admin::CategorySerializer, status: :ok
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end

    def create
      if @category.save
        render json: @category, serializer: Admin::CategorySerializer, status: :created
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

      def set_categories
        fetch_categories
      end

      def fetch_categories
        categories = @categories
        categories = categories.page(page).per_page(page_size) if page
        categories
      end
  end
end
