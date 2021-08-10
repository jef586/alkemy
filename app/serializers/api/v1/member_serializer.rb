# frozen_string_literal: true

module Api
  module V1
    class MemberSerializer < ApplicationSerializer
      attributes :name,
                  :facebook_url,
                  :instagram_url,
                  :linkedin_url,
                  :description,
                  :image_url
    end
  end
end
