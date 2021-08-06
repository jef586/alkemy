# frozen_string_literal: true

module Api
  module V1
    class ProfilesController < ApiController
      def show
        render json: @current_user, serializer: Profiles::ProfileSerializer, status: :ok
      end
    end
  end
end
