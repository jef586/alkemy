# frozen_string_literal: true

module Api
  module V1
    module Profiles
      class ProfileSerializer < ApplicationSerializer
        attributes :id,
                   :role,
                   :first_name,
                   :last_name,
                   :email,
                   :image_url
      end
    end
  end
end