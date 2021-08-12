# frozen_string_literal: true

class New < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_one_attached :image

  acts_as_paranoid

  # Validations
  validates :name,
            :content,
            presence: true
end
