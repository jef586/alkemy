# frozen_string_literal: true

module Api
    module V1
      class CommentariesController < ApiController      
        load_and_authorize_resource
  
        def index
          @commentay_index = Commentary.accessible_by(current_ability)
        end
  
        def show
        end
  
        def create
          # TO DO
          # create_commentary = Commentary.new(creation_commentary_params)
          if commentary.save
            # TO DO
            # render json: commentary, serializer: , status: :created
          else
            render json: { error: "We can't save your commentary" }, status: :unprocessable_entity
          end
        end
  
        def update
          if commentary.update(commentary_params)
            # TO DO 
            # render json: commentary, serializer , status: :ok
          else
            render json: { error: "We can't update the data" }, status: :unprocessable_entity
          end
        end
  
        def destroy
          commentary.destroy
        end
  
        private
        
        def commentary
          @commentary || = Commentary.find(params[:id])
        end
  
        def commentary_params
          params.require(:commentary).permit(:body)
        end
  
      end
    end
  end
  