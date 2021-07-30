# frozen_string_literal: true

module Authenticable
  extend ActiveSupport::Concern

  included do
    def find_user(params)
      @user ||= User.find_by(email: params[:email])
    end

    def authenticate_user
      return unless @user

      BCrypt::Password.create(@user.password_digest) == params[:password]
    end

    def generate_token
      JsonWebToken.encode({ user_id: @user.id, email: @user.email })
    end
  end
end
