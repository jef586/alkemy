class Category < ApplicationRecord
  acts_as_paranoid
  has_one_attached :image
end
