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
    end

    def create
    end

    def destroy
    end

    private
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
