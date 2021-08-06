# frozen_string_literal: true

class ProfileSerializer < ApplicationSerializer
  attributes :id,
                :role,
                :first_name,
                :last_name,
                :email,
                :image_url
end
