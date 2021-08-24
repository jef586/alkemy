# frozen_string_literal: true

module RequestHelpers
  module SignInHelper
    def sign_in(user)
      JsonWebToken.encode(user_id: user.id)
    end
  end
end
