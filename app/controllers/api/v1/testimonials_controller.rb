# frozen_string_literal: true

module Api
  module V1
    class TestimonialsController < ApiController
      def index
      end

      def show
      end

      def update
      end

      def create
      end

      def destroy
        if @testimonial.present?
          @testimonial.destroy
        end
      end
    end
  end
end
