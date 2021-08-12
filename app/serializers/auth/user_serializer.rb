# frozen_string_literal: true

module Auth
  class UserSerializer < ApplicationSerializer
    attributes :id,
               :role,
               :first_name,
               :last_name,
               :email,
               :expires_at,
               :token

    def role
      object.role.name
    end

    def expires_at
      @instance_options[:expires_at]
    end

    def token
      @instance_options[:token]
    end
  end
end
