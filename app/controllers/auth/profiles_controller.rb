# frozen_string_literal: true

module Auth
  class ProfilesController < ApiController
    def show
      render json: @current_user, serializer: Profiles::ProfileSerializer, status: :ok
    end
  end
end
