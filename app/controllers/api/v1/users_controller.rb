# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        render json: set_users
      end

      def show
      end

      def create
      end

      def update
      end

      def destroy
      end

      private
        def set_users
          User.all
        end
    end
  end
end
