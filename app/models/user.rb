# frozen_string_literal: true

class User < ApplicationRecord
  # Soft Delete
  acts_as_paranoid
  # Active Storage
  has_one_attached :image
  # Associations
  belongs_to :role
  
  #Authentication
  has_secure_password
  
  # Validations
  validates :first_name,
            :last_name,
            :email,
            :password,
            presence: true

  validates :email, uniqueness: true
end
