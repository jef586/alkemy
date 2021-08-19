# frozen_string_literal: true

module Admin
  class SlidesController < ApiController
    def index
      render json: @slides, each_serializer: SlideSerializer
    end
    def create
      if @slide.valid?
        @slide.save
        render json: @slide, serializer: SlideSerializer, status: :created
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
  end
end
