class Organization < ApplicationRecord
  # Softdelete
  acts_as_paranoid

  # Active Storage Image
  has_one_attached :image

  # Associations

  # Validations
  validates :name, 
            :email, 
            :welcome_text, 
            presence: true
end
