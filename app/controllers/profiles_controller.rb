   # frozen_string_literal: true

   class ProfilesController < ApiController
     def show
       render json: @current_user, serializer: ProfileSerializer, status: :ok
     end
   end
