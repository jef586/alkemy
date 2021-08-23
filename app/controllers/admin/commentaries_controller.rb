# frozen_string_literal: true

module Admin
  class CommentariesController < ApiController
    def index
      render json: set_commentaries, each_serializer: CommentarySerializer, status: :ok
    end

    def show
    end

    def update
    end

    def create
    end

    def destroy
    end

    private
      def set_commentaries
        fetch_commentaries
      end

      def fetch_commentaries
        comments = @commentaries
        comments = comments.order("created_at DESC")
        comments = comments.by_body_content(body) if body
        comments
      end

      def body
        params[:body]
      end
  end
end
