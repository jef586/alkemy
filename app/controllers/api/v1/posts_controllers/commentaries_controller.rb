# frozen_string_literal: true

module Api
  module V1
    module PostsControllers
      class CommentariesController < ApiController
        before_action :commentaries

        def index
          render json: @commentaries, each_serializer: CommentarySerializer, status: :ok
        end

        private
          def commentaries
            @commentaries = Commentary.where(post_id: post_id)
          end

          def post_id
            params[:post_id]
          end
      end
    end
  end
end
