# frozen_string_literal: true

class Role < ApplicationRecord
  enum name: { admin: "administrator", regular: "regular", visitor: "visitor" }

  # Associations
  has_many :users

  # Validations
  validates :name, presence: true
end
