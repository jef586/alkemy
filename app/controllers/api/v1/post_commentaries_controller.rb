# frozen_string_literal: true

module Api
  module V1
    # module PostsControllers
      class PostCommentariesController < ApiController

        def show
          render json: @commentaries, each_serializer: CommentarySerializer, status: :ok
        end

        private
        def commentaries
          @commentaries ||= Commentary.where(post_id: params[:post_id])
        end

        def include_params
          ["**"]
        end
      end
    # end
  end
end