# frozen_string_literal: true

class Contact < ApplicationRecord
  acts_as_paranoid

  # Associations
  belongs_to :from_user, class_name: "User"

  # Validations
  validates :name,
            :phone_number,
            :email,
            presence: true
end
