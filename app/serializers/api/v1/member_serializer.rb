# frozen_string_literal: true

module Api
  module V1
    class MemberSerializer < ApplicationSerializer
      attributes :id,
                 :name,
                 :facebook_url,
                 :instagram_url,
                 :linkedin_url,
                 :description
      end
  end
end
