module Api 
  module V1 
    class OrganizationsController < ApiController
      
      def index
      render json: { message: " organizations_index "}
      end

      def show
        render json: { message: " organizations_show"}
      end

      def create
        render json: { message: " organizations_create "}
      end

      def update
        render json: { message: " organizations_update "}
      end

      def destroy
        render json: { message: " organizations_destroy "}
      end

      def restore
        render json: { message: " organizations_restore "}
      end
    end
  end
end