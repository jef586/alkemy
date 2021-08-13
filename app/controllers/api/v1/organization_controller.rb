# frozen_string_literal: true

module Api
  module V1
    class OrganizationController < ApiController
      skip_before_action :authorize_request, only: %i[public]

      def public
        render json: organization, each_serializer: Organizations::OrganizationSerializer, status: :ok
      end

      def create
      end

      def update
      end

      def destroy
      end

      private
        def organization
          @organization = Organization.where(name: "Somos Más")
        end
    end
  end
end
