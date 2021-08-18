# frozen_string_literal: true

module Admin
  class ActivitiesController < ApiController
    def index
    end

    def show
    end

    def update
      if @activity.update(update_params)
        render json: @activity, serializer: ActivitySerializer, status: :ok
      else
        render json: { error: "We can't update the data" }, status: :unprocessable_entity
      end
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
      def update_params
        params.permit(:name, :content)
      end
  end
end
