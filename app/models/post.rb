# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user
  has_one_attached :image
  has_many :commentaries

  acts_as_paranoid

  # Validations
  validates :name,
            :content,
            presence: true
end
