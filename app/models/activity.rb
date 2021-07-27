class Activity < ApplicationRecord

  # Validations
  validates :name,
            :content,
            presence: true
end
