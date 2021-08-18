# frozen_string_literal: true

module Admin
  class TestimonialsController < ApiController
    def destroy
      if @testimonial.present?
        @testimonial.destroy
      end

      head :no_content
    end
  end
end
