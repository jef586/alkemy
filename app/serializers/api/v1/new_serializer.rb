# frozen_string_literal: true

module Api
  module V1
    class NewSerializer < ApplicationSerializer
      attributes :id,
                 :name,
                 :content
    end
  end
end
