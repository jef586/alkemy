# frozen_string_literal: true

module Admin
  class SlideSerializer < ApplicationSerializer
    attributes :id, :organization_id, :text, :order
  end
end
