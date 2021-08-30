# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApiController
      include Paginable

      def index
        render json: set_categories, meta: pagination_fields(set_categories), each_serializer: Categories::IndexCategorySerializer, status: :ok
      end

      private
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
end
