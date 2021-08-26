# frozen_string_literal: true

module Admin
  class ActivitiesController < ApiController

    def create
      if @activity.save
        render json: @activity, serializer: ActivitySerializer, status: :created
      else
        render json: { errors: @activity.errors }, status: :unprocessable_entity
      end
    end

    def update
      if @activity.update(update_params)
        render json: @activity, serializer: Admin::ActivitySerializer, status: :ok
      else
        render json: @activity.errors, status: :unprocessable_entity
      end
    end


    private
      def update_params
        params.permit(:name, :content)
      end

      def create_params
        params.permit(:name,:content)
      end
  end
end
