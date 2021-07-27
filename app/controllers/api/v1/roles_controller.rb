module Api 
  module V1
    class RolesController < ApiController
      def index
        render json: {message: 'roles_index'}
      end
      
      def show
        render json: {message: 'roles_show'}
      end

      def create
        render json: {message: 'roles_create'}
      end

      def update
        render json: {message: 'roles_update'}
      end

      def destroy
        render json: {message: 'roles_destroy'}
      end
    end
  end
end