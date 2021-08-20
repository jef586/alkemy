# frozen_string_literal: true

module Admin
  class SlidesController < ApiController
    before_action :fetch_slides
    def index
      @slides = Slide.all
      render json: @slides, each_serializer: SlideSerializer, status: :ok
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
      def fetch_slides
        slide = slide.for_text(text) if text
        slide = slide.for_order(order) if order
        slide
      end
      def text
        params[:text]
      end
      def order
        params[:order]
      end
  end
end
