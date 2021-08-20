# frozen_string_literal: true

module Admin
  class SlideSerializer < ApplicationSerializer
    attributes :id,
               :text
  end
end
