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
        create_commentary = Commentary.new(create_commentary_params)

        if create_commentary.save
          render json: create_commentary, serializer: CommentarySerializer, status: :created
        else
          render json: { errors: create_commentary.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        if commentary.present?
          commentary.destroy
        end

        head :no_content
      end

      private
        def commentary
          @commentary ||= @current_user.commentaries.find(params[:id])
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
            ).merge(user: current_user)
        end
    end
  end
end
