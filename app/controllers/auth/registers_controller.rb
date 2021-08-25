# frozen_string_literal: true

module Auth
  class RegistersController < ApplicationController
    def create
      user = User.new(user_params)

      if user.save
        token = JsonWebToken.encode(user_id: user.id)
        time = Time.now + 24.hours.to_i
        UserNotifierMailer.send_signup_email(user).deliver

        render json: user, serializer: Auth::UserSerializer, token: token, expires_at: time, status: :created
      else
        render json: { errors: user.errors }, status: :unprocessable_entity
      end
    end

  private
    def user_params
      params.permit(:first_name, :last_name, :email, :password)
    end
  end
end
