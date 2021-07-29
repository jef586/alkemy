# frozen_string_literal: true

class New < ApplicationRecord
  belongs_to :category
  has_one_attached :image

  acts_as_paranoid column: :deletedAt

  # Validations
  validates :name,
            :content,
            presence: true
end
