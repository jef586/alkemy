# frozen_string_literal: true

module RequestHelpers
  module SignInHelper
    # We are outside of the controller, it's not the same method
    attr_reader :current_user

    def sign_in(user)
      JsonWebToken.encode(user_id: user.id)
    end
    def token_user_id(token)
      JsonWebToken.decode(token)["user_id"]
    end
  end
end
