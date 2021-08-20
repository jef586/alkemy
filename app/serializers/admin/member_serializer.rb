# frozen_string_literal: true

module Admin
  class MemberSerializer < ApplicationSerializer
    attributes :id,
               :name,
               :facebook_url,
               :instagram_url,
               :linkedin_url,
               :description
  end
end
