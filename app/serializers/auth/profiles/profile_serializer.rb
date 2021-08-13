# frozen_string_literal: true

module Auth
  module Profiles
    class ProfileSerializer < ApplicationSerializer
      attributes :id,
                 :role,
                 :first_name,
                 :last_name,
<<<<<<< Updated upstream
                 :email
=======
                 :email,
                 :image_url

>>>>>>> Stashed changes
      def role
        object.role.name
      end
    end
  end
end
