# frozen_string_literal: true

module Api
  module V1
    class TestimonialsController < ApiController
      include Paginable

      def index
        render json: set_testimonials, meta: pagination_fields(set_testimonials), each_serializer: Admin::TestimonialSerializer, status: :ok
      end

      def show
      end

      def update
      end

      def create
      end

      def destroy
      end

      private
        def set_testimonials
          fetch_testimonials
        end

        def fetch_testimonials
          testimonials = @testimonials
          testimonials = testimonials.page(page).per_page(page_size) if page
          testimonials
        end
    end
  end
end
