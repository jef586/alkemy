# frozen_string_literal: true

module Api
  module V1
    module Users
      class UserSerializer < ApplicationSerializer
        attributes :id,
                   :role,
                   :first_name,
                   :last_name,
                   :email,
                   :image_url

        def role
          object.role.name
        end
      end
    end
  end
end
