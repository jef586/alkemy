# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:show, :update, :destroy]
      def index
      end

      def show
      end

      def create
      end

      def update
      end

      def destroy
        @user.destroy
      end

      private
        def set_user
          @user = User.find(params[:id])
        end
    end
  end
end
