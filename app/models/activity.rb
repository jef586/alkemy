class Activity < ApplicationRecord
  acts_as_paranoid column: :deletedAt

  # Validations
  validates :name,
            :content,
            presence: true
end
