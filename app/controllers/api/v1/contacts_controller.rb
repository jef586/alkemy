# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      def index
        render json: contacts, each_serializer: ContactSerializer, status: :ok
      end

      private
        def contacts
          @contacts ||= Contact.all
        end
    end
  end
end
