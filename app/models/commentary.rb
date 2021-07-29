# frozen_string_literal: true

class Commentary < ApplicationRecord
  belongs_to :User
  belongs_to :New

  # Validations
  validates :body, presence: true
end
