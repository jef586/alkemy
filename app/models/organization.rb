class Organization < ApplicationRecord
  # Associations

  # Validations
  validates :name, :email, :welcomeText, presence: true
end
