class User < ApplicationRecord
  # Soft Delete
  acts_as_paranoid
  # Active Storage
  has_one_attached :image
  # Associations
  belongs_to :role
  # Validations
  validates :name, presence: true
end
