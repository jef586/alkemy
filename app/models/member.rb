# frozen_string_literal: true

class Member < ApplicationRecord
  # Validations
  validates :name, presence: true
end
