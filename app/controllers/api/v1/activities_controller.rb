# frozen_string_literal: true

module Api
  module V1
    class ActivitiesController < ApiController
      def index
      end

      def show
      end

      def update
      end

      def create
        if @activity.save
          render json: @activity, serializer: ActivitySerializer, status: :created
        else
          render json: { errors: @activity.errors }, status: :unprocessable_entity
        end
      end

      def destroy
      end

      private
        def activity_params
          params.permit(
              :name,
              :content
            )
        end
    end
  end
end
