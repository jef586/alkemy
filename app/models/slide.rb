# frozen_string_literal: true

class Slide < ApplicationRecord
  # Active Storage
  has_one_attached :image
  # Associations
  belongs_to :organization
  # Validations
  validates :image_url,
            :text,
            presence: true

  validates :order, numericality: { only_integer: true }, allow_nil: true
end
