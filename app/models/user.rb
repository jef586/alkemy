class User < ApplicationRecord
  # Soft Delete
  acts_as_paranoid
  # Active Storage
  has_one_attached :image
  # Associations
  belongs_to :role
  # Validations
  validates :first_name,
            :last_name,
            :email,
            :password,
            presence: true

  # TODO: falta agregar a nivel db
  validates :email, uniqueness: true
end
