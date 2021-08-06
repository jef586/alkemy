# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      def index
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
        def user
          @user ||= User.find(params[:id])
        end
    end
  end
end
