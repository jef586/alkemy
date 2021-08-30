# frozen_string_literal: true

module Api
  module V1
    class MembersController < ApiController
      include Paginable

      def index
        render json: set_members, meta: pagination_fields(set_members), each_serializer: MemberSerializer, status: :ok
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
        def set_members
          fetch_members
        end

        def fetch_members
          members = @members
          members = members.page(page).per_page(page_size) if page
          members
        end
    end
  end
end
