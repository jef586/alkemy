# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      def index
        render json: users, each_serializer: Users::UserSerializer, status: :ok
      end

      def show
      end

      def create
      end

      def update
        if user.update(user_params)
          render json: user, serializer: UserSerializer, status: :ok
        else
          render_error
        end
      end

      def destroy
        if user.present?
          user.destroy
        end

        head :no_content
      end

      private
        def users
          @users ||= User.all
        end

        def user
          @user ||= User.find(params[:id])
        end

        def user_params
          params.permit(:first_name, :last_name, :email, :password)
        end

        def render_error
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end
  end
end
