# frozen_string_literal: true

class Commentary < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true

  # Validations
  validates :body, presence: true

  # Scopes
  scope :by_body_content, -> (query) { where("body LIKE ?", "%#{query}%") }
end
