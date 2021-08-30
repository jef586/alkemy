# frozen_string_literal: true

module Paginable
  extend ActiveSupport::Concern

  DEFAULT_PAGE_SIZE = 10

  included do
    private
      def page
        @page ||= params[:page]
      end

      def page_size
        @page_size ||= determine_page_size
      end

      def determine_page_size
        size = params[:page_size].to_i
        size.zero? ? self.class::DEFAULT_PAGE_SIZE : size
      end

      def pagination_fields(collection)
        return if !page
        {
          current_page: collection.current_page,
          next_page: collection.next_page,
          prev_page: collection.previous_page, # use collection.previous_page when using will_paginate
          total_pages: collection.total_pages,
          total_count: collection.total_entries,
          per_page: collection.per_page
        }
      end
  end
end
