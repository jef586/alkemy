# frozen_string_literal: true

module Api
  module V1
    class MembersController < ApiController
      def index
        render json: @members, each_serializer: MemberSerializer, status: :ok
      end

      def show
      end

      def create
      end

      def update
        if @member.update(member_params)
          render json: @member, serializer: MemberSerializer, status: :ok
        else
          render json: @member.errors, status: :unprocessable_entity
        end
      end

      def destroy
      end

      private
        def member_params
          params.permit(
            :name,
            :facebook_url,
            :instagram_url,
            :linkedin_url,
            :description
          )
        end
    end
  end
end
