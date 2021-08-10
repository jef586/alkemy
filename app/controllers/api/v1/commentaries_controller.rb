# frozen_string_literal: true

module Api
  module V1
    class CommentariesController < ApiController
      def index
        render json: commentaries, each_serializer: CommentarySerializer, status: :ok
      end

      def show
      end

      def update
        if commentary.update(update_commentary_params)
          render json: commentary, serializer: CommentarySerializer, status: :ok
        else
          render json: { error: "We can't update the data" }, status: :unprocessable_entity
        end
      end

      def create
      end

      def destroy
      end

      private
        def commentaries
          @commentaries = Commentary.all
        end

        def commentary
          @commentary ||= current_user.commentaries.find(params[:id])
        end

        def update_commentary_params
          params.permit(
              :body
            )
        end
    end
  end
end
