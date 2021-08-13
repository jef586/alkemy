# frozen_string_literal: true

class Organization < ApplicationRecord
  # Softdelete
  acts_as_paranoid

  # Active Storage Image
  has_one_attached :image

  # Associations
  belongs_to :user
  has_many :slides

  # Validations
  validates :name,
            :email,
            :welcome_text,
            presence: true
end
