# frozen_string_literal: true

module Api
  module V1
    class CommentariesController < ApiController
      def index
        render json: @commentaries
      end

      def show
      end

      def update
        if @commentary.update(commentary_params)
          render json: @commentary, serializer: CommentarySerializer, status: :ok
        else
          render json: { error: "We can't update the data" }, status: :unprocessable_entity
        end
      end

      def create
      end

      def destroy
      end

      private
        def commentary_params
          params.permit(
              :body
            )
        end
    end
  end
end
