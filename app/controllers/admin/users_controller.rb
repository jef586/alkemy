# frozen_string_literal: true

module Admin
    class UsersController < ApiController
      def index
        render json: @users, each_serializer: Admin::UserSerializer, status: :ok
      end

      def show
      end

      def create
      end

      def update
      end

      def destroy
      end
    end
end
