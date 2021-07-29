# frozen_string_literal: true

module Api
  module V1
    class SessionController < ApplicationController
      def login
        auth = Authentication.new(login_params)
        if auth.authenticate
          render json: { message: "¡Successful login!", token: auth.generar_token }, status: :ok
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
