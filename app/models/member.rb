# frozen_string_literal: true

class Member < ApplicationRecord
  # Soft Delete
  acts_as_paranoid
  # Active Storage
  has_one_attached :image
  # Associations

  # Validations
  validates :name, presence: true
end
