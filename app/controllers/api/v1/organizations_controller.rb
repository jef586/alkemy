# frozen_string_literal: true

module Api
  module V1
    class OrganizationsController < ApiController
      skip_before_action :authorize_request, only: [:show]

      def show
        render json: @organization, serializer: OrganizationSerializer, status: :ok
      end

      def create
      end

      def update
        # to do: implement only admin privilege
        if organization.update(organization_parameters)
          render json: organization, serializer: OrganizationSerializer, status: :ok
        else
          render json: organization.errors, status: :unprocessable_entity
        end
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
