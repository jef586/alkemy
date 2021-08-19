# frozen_string_literal: true

module Admin
  class CommentariesController < ApiController
    before_action :fetch_commentaries
    def index
      @commentaries = Commentary.all
      render json: @commentaries, each_serializer: CommentarySerializer, status: :ok
    end

    def show
    end

    def update
      if @commentary.update(update_params)
        render json: @commentary, serializer: CommentarySerializer, status: :ok
      else
        render json: { error: "We can't update the data" }, status: :unprocessable_entity
      end
    end

    def create
      if @commentary.save
        render json: @commentary, serializer: CommentarySerializer, status: :created
      else
        render json: { errors: create_params.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      if @commentary.present?
        @commentary.destroy
      end

      head :no_content
    end

    private
      def update_params
        params.permit(
            :body
          )
      end

      def create_params
        params.permit(
            :body,
            :post_id
          ).merge(user: current_user)
      end

      def fetch_commentaries
        comment = comment.for_creation_date(date_of_creation) if date_of_creation
        comment = comment.for_body(body) if body
        comment
      end
      def date_of_creation
        params[:date_of_creation]
      end
      def body
        params[:body]
      end
  end
end
