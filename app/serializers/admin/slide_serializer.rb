# frozen_string_literal: true

module Admin
  class SlideSerializer < ApplicationSerializer
    attributes :id, :organization_id, :text, :order, :image_url
    def image_url
      object.image.url
    end
  end
end
