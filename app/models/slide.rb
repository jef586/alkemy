# frozen_string_literal: true

class Slide < ApplicationRecord
  # Active Storage
  has_one_attached :image

  # Associations
  belongs_to :organization

  # Validations
  validates :text,
            presence: true

  validates :order,
            numericality: { only_integer: true, greater_than_or_equal_to: 1 },
            allow_nil: true,
            uniqueness: true

  validates :image, presence: true, blob: { content_type: :image, size_range: 1..3.megabytes }

  # Scopes
  scope :order_by_order, -> { order(order: :asc) }
end
