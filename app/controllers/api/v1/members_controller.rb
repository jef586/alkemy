# frozen_string_literal: true

module Api
  module V1
    class MembersController < ApiController
      def index
        render json: members, each_serializer: MemberSerializer, status: :ok
      end

      def show
      end

      def create
      end

      def update
      end

      def destroy
      end

      private
        def members
          @members ||= Member.all
        end
    end
  end
end
