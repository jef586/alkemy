# frozen_string_literal: true

module Api
  module V1
    class OrganizationsController < ApiController
      def index
      end

      def show
        render json: organization, serializer: Organizations::OrganizationSerializer, status: :ok
      end

      def create
      end

      def update
      end

      def destroy
      end

      private
      def organization
        @organization = Organization.find(params[:id])
      end
    end
  end
end
