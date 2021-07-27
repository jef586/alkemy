class Role < ApplicationRecord
  # Associations

  # Validations
  validates :name, presence: true
end
