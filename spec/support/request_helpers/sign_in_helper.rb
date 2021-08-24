# frozen_string_literal: true

module RequestHelpers
  module SignInHelper
    # We are outside of the controller, it's not the same method
    attr_reader :current_user

    def sign_in(user)
      @auth_headers = JsonWebToken.encode(user_id: user.id)
      @current_user = user
    end

    def token_user_id(token)
      JsonWebToken.decode(token)["user_id"]
    end

    %w[get post put patch delete].each do |http_method|
      # Override request methods to hook login headers
      define_method(http_method) do |path, **args|
        # If there are headers, append them to the request
        if @auth_headers
          args[:headers] ||= {}
          args[:headers] = { "Authorization" => @auth_headers }
        end

        super(path, **args)
      end
    end
  end
end
