class New < ApplicationRecord
  belongs_to :categories
  has_one_attached :image

  acts_as_paranoid column: :deletedAt

  # Validations
  validates :name,
            :content,
            presence: true

end
