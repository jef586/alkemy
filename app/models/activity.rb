# frozen_string_literal: true

class Activity < ApplicationRecord
  acts_as_paranoid column: :deletedAt

  # Validations
  validates :name,
            :content,
            presence: true
end
