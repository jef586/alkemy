# frozen_string_literal: true
module api
  module v1
    class RegisterController < ApiController
      def create
        user = User.new(user_params)
        if user.save
          render json: user, status: :ok
        else
          render json: "error", status: :unprocessable_entity
        end
                
      end
    end

  end
    
end
