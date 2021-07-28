class Role < ApplicationRecord
  # Associations
  has_many :users
  # Validations
  validates :name, presence: true
end
