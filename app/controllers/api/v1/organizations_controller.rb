# frozen_string_literal: true

module Api
  module V1
    class OrganizationsController < ApiController
      skip_before_action :authorize_request, only: [:show]

      def show
        render json: organization, serializer: OrganizationSerializer, status: :ok
      end

      def create
      end

      def update
      end

      def destroy
      end

      private
        def organization
          @organization ||= Organization.first
        end
    end
  end
end
