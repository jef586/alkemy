# frozen_string_literal: true

module Admin
  class TestimonialsController < ApiController
    def update
      if @testimonial.update(update_params)
        render json: @testimonial, serializer: Admin::TestimonialSerializer, status: :ok
      else
        render json: { error: @testimonial.errors }, status: :unprocessable_entity
      end
    end

    def create
      if @testimonial.save
        render json: @testimonial, serializer: TestimonialSerializer, status: :created
      else
        render json: { errors: @testimonial.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      if @testimonial.present?
        @testimonial.destroy
      end

      head :no_content
    end

    private
      def update_params
        params.permit(
          :name,
          :content
        )
      end


      def create_params
        params.permit(
          :name,
          :content
        ).merge(user: current_user)
      end
  end
end
