# frozen_string_literal: true

module Api
  module V1
    class MembersController < ApiController
      load_and_authorize_resource

      def index
<<<<<<< HEAD
        @member_index = Member.accessible_by(current_ability)
=======
        render json: members, each_serializer: MemberSerializer, status: :ok
>>>>>>> dev
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
