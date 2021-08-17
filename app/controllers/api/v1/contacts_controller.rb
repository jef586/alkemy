# frozen_string_literal: true

module Api
  module V1
    class ContactsController < ApiController
      def index
        render json: @contacts, each_serializer: ContactSerializer, status: :ok
      end
      def create
        @contact.from_user = current_user
        if @contact.save
          render json: @contact, serializer: ContactSerializer, status: :created
        else
          render json: { errors: @contact.errors }, status: :unprocessable_entity
        end
      end

        private
          def create_params
            params.permit(
              :email,
              :phone_number,
              :message,
              :name
            )
          end
    end
  end
end
