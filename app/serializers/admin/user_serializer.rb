# frozen_string_literal: true

module Admin
  class UserSerializer < ApplicationSerializer
    attributes :id,
               :role,
               :first_name,
               :last_name,
               :email
    def role
      object.role.name
    end
  end
end
