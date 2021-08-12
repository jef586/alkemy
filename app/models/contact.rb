# frozen_string_literal: true

class Contact < ApplicationRecord
  acts_as_paranoid

  # Validations
  validates :name,
            :phone,
            :message,
            presence: true
end
