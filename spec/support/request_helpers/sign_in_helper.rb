module RequestHelpers
  module SignInHelper

    def sign_in(user)
      token = JsonWebToken.encode(user_id: user.id)
    end


  end
end
