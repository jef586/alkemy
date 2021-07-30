# frozen_string_literal: true

module Api
  module V1
    class SessionController < ApiController
      include Authenticable

      def login
        find_user(login_params)

        if authenticate_user
          render json: { message: "¡Successful login!", token: generate_token }, status: :ok
        else
          render json: { message: "Incorrect email or password" }, status: :unauthorized
        end
      end

        private
          def login_params
            params.permit(:email, :password)
          end
    end
  end
end
