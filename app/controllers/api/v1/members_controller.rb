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
        if @member.save
          render json: @member, serializer: MemberSerializer, status: :created
        else
          render json: { errors: create_params.errors }, status: :unprocessable_entity
        end
      end

      def update
      end

      def destroy
      end

      private
        def create_params
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
