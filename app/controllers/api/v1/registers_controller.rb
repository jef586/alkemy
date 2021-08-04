# frozen_string_literal: true
module Api
  module V1
    class RegistersController < ApiController
      def create
        user = User.new(user_params)
        if user.save
          render json: user, status: :ok
        else
          render json: "error", status: :unprocessable_entity
        end
      end

    private
      def user_params
        params.permit(:first_name, :last_name, :email, :password)
      end
      
    end

  end
    
end
