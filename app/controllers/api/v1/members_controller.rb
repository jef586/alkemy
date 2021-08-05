# frozen_string_literal: true

module Api
  module V1
    class MembersController < ApiController      
      load_and_authorize_resource

      def index
        @member_index = Member.accessible_by(current_ability)
      end

      def show
      end

      def create
        # TO DO
        # create_member = Member.new(creation_member_params)
        if member.save
          # TO DO
          # render json: member, serializer: , status: :created
        else
          render json: { error: "We can't save your member" }, status: :unprocessable_entity
        end
      end

      def update
        if member.update(member_params)
          # TO DO 
          # render json: member, serializer , status: :ok
        else
          render json: { error: "We can't update the data" }, status: :unprocessable_entity
        end
      end

      def destroy
        member.destroy
      end

      private
      
      def member
        @member || = Member.find(params[:id])
      end

      def member_params
        params.require(:member).permit(:body)
      end

    end
  end
end
