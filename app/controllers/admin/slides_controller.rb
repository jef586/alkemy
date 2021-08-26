# frozen_string_literal: true

module Admin
  class SlidesController < ApiController
    def index
      render json: set_slides, each_serializer: Admin::SlideSerializer, status: :ok
    end

    def show
      render json: @slide, serializer: SlideSerializer
    end

    def create
      if @slide.save
        render json: @slide, serializer: SlideSerializer, status: :created
      else
        render json: { error: @slide.errors }, status: :unprocessable_entity
      end
    end

    def update
      @slide.assign_attributes(update_params)

      if @slide.valid?
        @slide.image.purge if params[:image]
        @slide.assign_attributes(update_params)
        @slide.save

        render json: @slide, serializer: Admin::SlideSerializer, status: :ok
      else
        render json: { error: @slide.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      if @slide.present?
        @slide.destroy
      end

      head :no_content
    end

   private
     def create_params
       params.permit(
         :text,
         :image,
         :order
       ).merge(organization: Organization.first)
     end

     def update_params
       params.permit(
           :text,
           :image,
           :order
         )
     end

     def set_slides
       fetch_slides
     end

     def fetch_slides
       slides = @slides
       slides = slides.by_order
       slides = slides.by_text(text) if text
       slides
     end

     def text
       params[:text]
     end
  end
end
