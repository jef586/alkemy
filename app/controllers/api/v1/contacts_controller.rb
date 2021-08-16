# frozen_string_literal: true

module Api
  module V1
    class ContactsController < ApiController
      def index
        render json: @contacts, each_serializer: ContactSerializer, status: :ok
      end
    end
  end
end
