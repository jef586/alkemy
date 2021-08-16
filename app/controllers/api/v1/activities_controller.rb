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
        create_activity = Activity.new(create_activity_params)

        if create_activity.save
          render json: create_activity, serializer: ActivitySerializer, status: :created
        else
          render json: { errors: create_activity.errors }, status: :unprocessable_entity
        end
      end

      def destroy
      end

      private
        def create_activity_params
          params.permit(
              :name,
              :content
            )
        end
    end
  end
end
