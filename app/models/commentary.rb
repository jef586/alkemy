# frozen_string_literal: true

class Commentary < ApplicationRecord
  belongs_to :user
  belongs_to :new

  # Validations
  validates :body, presence: true
end
