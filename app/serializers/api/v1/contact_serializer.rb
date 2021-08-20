# frozen_string_literal: true

module Api
  module V1
    class ContactSerializer < ApplicationSerializer
      attributes :id,
                 :name,
                 :phone_number,
                 :email
    end
  end
end
