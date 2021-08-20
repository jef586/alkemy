# frozen_string_literal: true

module Admin
  class TestimonialsController < ApiController
    def create
      if @testimonial.save
        render json: @testimonial, serializer: TestimonialSerializer, status: :created
      else
        render json: { errors: create_params.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      if @testimonial.present?
        @testimonial.destroy
      end

      head :no_content
    end

    private
      def create_params
        params.permit(
          :name,
          :content
        )
      end
  end
end
