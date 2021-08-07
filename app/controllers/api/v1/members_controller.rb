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
      end

      def update
      end

      def destroy
      end
    end
  end
end
