# frozen_string_literal: true

module Api
  module V1
    class OrganizationsController < ApiController
      skip_load_and_authorize_resource
      skip_before_action :authorize_request, only: [:show]

      def show
        render json: organization, serializer: OrganizationSerializer, status: :ok
      end

      def create
      end

      def destroy
      end

      private
        def organization
          @organization ||= Organization.first
        end

        def organization_parameters
          params.permit(:name,
                        :address,
                        :phone,
                        :email,
                        :welcome_text,
                        :about_us_text
                       )
        end
    end
  end
end
