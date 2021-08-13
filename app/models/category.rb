# frozen_string_literal: true

class Category < ApplicationRecord
  acts_as_paranoid
  has_one_attached :image

  # Validations
  validates :name,
            :description,
            presence: true
  validate :name_must_be_a_string

  validate :name_must_be_a_string

  # Associations
  has_many :news

  def name_must_be_a_string
    unless name.is_a? String
      errors.add(:name, :name_must_be_a_string)
    end
  end
end
