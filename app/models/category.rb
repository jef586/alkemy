# frozen_string_literal: true

class Category < ApplicationRecord
  acts_as_paranoid
  has_one_attached :image

  # Validations
  validates :name,
            :description,
            presence: true

  # Associations
  has_many :news
end
