module Api
  module V1
    class SlidesController < ApiController
      def index
        render json: @slides.order_by_order, each_serializer: SlideSerializer
      end
    end
  end
end