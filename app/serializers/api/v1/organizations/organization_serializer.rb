module Api
  module V1
    module Organizations
      class OrganizationSerializer < ApplicationSerializer
        attributes :id,
                   :name,
                   :image_url,
                   :phone,
                   :address
        end
      end
    end
  end
end