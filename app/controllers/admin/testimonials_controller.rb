module Admin
  class TestimonialsController < ApiController
    def destroy
      if @testimonial.present?
        @testimonial.destroy
      end
    end
  end
end
