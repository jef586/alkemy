module Api
    module V1
        class NewSerializer < ApplicationSerializer
            attributes :id,
                       :name,
                       :content,
                       :image_url
        end
    end
end