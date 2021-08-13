# frozen_string_literal: true

module Api
  module V1
    class ActivitySerializer < ApplicationSerializer
      attributes :name,
                 :content
    end
  end
end
