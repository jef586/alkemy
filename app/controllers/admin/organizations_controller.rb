# frozen_string_literal: true

module Admin
  class OrganizationsController < ApiController
    def update
      if organization.update(organization_parameters)
        render json: organization, serializer: Admin::OrganizationSerializer, status: :ok
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
