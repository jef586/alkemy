# frozen_string_literal: true

class Category < ApplicationRecord
  acts_as_paranoid
  has_one_attached :image

  # Associations
  has_many :news
end
