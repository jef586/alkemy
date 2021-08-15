# frozen_string_literal: true

module Auth
  module Profiles
    class ProfileSerializer < ApplicationSerializer
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
end
