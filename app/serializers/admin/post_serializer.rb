module Admin
  class PostSerializer < ApplicationSerializer
    attributes :id,
               :name,
               :content
  end
end