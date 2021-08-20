# frozen_string_literal: true

class Slide < ApplicationRecord
  # Active Storage
  has_one_attached :image
  # Associations
  belongs_to :organization
  # Validations
  ## TODO add proper image validations
  validates :text,
            presence: true

  validates :order, numericality: { only_integer: true }, allow_nil: true
  # scopes
  scope :for_text, -> (text) { where text: text }
  scope :for_order, -> (order) { where order: order }
end
