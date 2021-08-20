# frozen_string_literal: true

module Admin
  class MembersController < ApiController
    def index
    end

    def show
    end

    def create
    end

    def update
    end

    def destroy
      if @member.present?
        @member.destroy
      else
        render json: { error: @member.errors }, status: :unprocessable_entity
      end

      head :no_content
    end
  end
end
