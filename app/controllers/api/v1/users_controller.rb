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
    end
  end
end
