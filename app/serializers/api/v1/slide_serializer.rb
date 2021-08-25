# frozen_string_literal: true

module Api
  module V1
    class SlideSerializer < ApplicationSerializer
      attributes :id,
                 :text,
                 :order,
                 :image_url

      def image_url
        object.image.url
      end
    end
  end
end
