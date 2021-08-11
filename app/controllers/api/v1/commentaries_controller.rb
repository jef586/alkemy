# frozen_string_literal: true

module Api
    module V1
      class CommentariesController < ApiController
        def index
        end
        def show
        end
        def update
        end
        def create
        end
        def destroy
          if commentary.present?
            commentary.destroy
          end
  
          head :no_content
        end
  
        private
          def commentary
            @commentary = Commentary.find(params[:id])
          end
      end
    end
  end
  