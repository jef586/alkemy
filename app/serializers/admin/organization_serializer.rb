# frozen_string_literal: true

module Admin
  class OrganizationSerializer < ApplicationSerializer
    attributes :id,
                :name,
                :phone,
                :address,
                :email
  end
end
