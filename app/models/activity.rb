# frozen_string_literal: true

class Activity < ApplicationRecord
  acts_as_paranoid
  has_one_attached :image

  # Validations
  validates :name,
            :content,
            presence: true
end
