# frozen_string_literal: true

module Api
  module V1
    class NewsController < ApiController
      def index
      end

      def show
        render json: new, serializer: NewSerializer, status: :ok
      end

      def create
      end

      def update
      end

      def destroy
      end

      private
        def new
          @new ||= New.find(params[:id])
        end
    end
  end
end
