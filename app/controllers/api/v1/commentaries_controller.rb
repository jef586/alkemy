# frozen_string_literal: true

module Api
  module V1
    class CommentariesController < ApiController
      def index
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
        create_commentary = current_user.commentaries.new(create_commentary_params)
        create_commentary.save

        if create_commentary.persisted?
          render json: create_commentary, serializer: CommentarySerializer, status: :created
        else
          render json: { errors: create_commentary.errors }, status: :unprocessable_entity
        end
      end

      def destroy
      end

      private
        def commentary
          @commentary ||= @current_user.commentaries.find(params[:id])
        end

        def commentaries
          @commentaries ||= fetch_commentaries
        end

        def fetch_commentaries
          commentaries = Commentary.all
          commentaries
        end

        def update_commentary_params
          params.permit(
              :body
            )
        end

        def create_commentary_params
          params.permit(
              :body,
              :new_id
            )
        end
    end
  end
end
