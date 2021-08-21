# frozen_string_literal: true

module Admin
  class ActivitySerializer < ApplicationSerializer
    attributes :id,
               :name,
               :content
  end
end
