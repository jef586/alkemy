# frozen_string_literal: true

module Admin
  class SlidesController < ApiController
    def create
      if @slide.valid?
        @slide.save
        render json: @slide, serializer: SlideSerializer, status: :created
      else
        render json: { error: @slide.errors }, status: :unprocessable_entity
      end
    end
    def update
      if @slide.update(update_params)
        render json: @slide, serializer: Admin::SlideSerializer, status: :ok
      else
        render json: { error: @slide.errors }, status: :unprocessable_entity
      end
    end

    private
      def create_params
        params.permit(
          :text,
          :image,
          :order,
          :organization_id
        )
      end
      def update_params
        params.permit(
            :text
          )
      end
  end
end
