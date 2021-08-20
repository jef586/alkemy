# frozen_string_literal: true

module Admin
  class SlidesController < ApiController
    def update
      if @slide.update(update_params)
        render json: @slide, serializer: Admin::SlideSerializer, status: :ok
      else
        render json: { error: @slide.errors }, status: :unprocessable_entity
      end
    end

      private
        def update_params
          params.permit(
              :text
            )
        end
  end
end
