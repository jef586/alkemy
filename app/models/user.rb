# frozen_string_literal: true

class User < ApplicationRecord
  # Soft Delete
  acts_as_paranoid

  # Active Storage
  has_one_attached :image

  # Associations
  belongs_to :role, optional: true
  has_many :commentaries
  has_many :news
  has_one :organization
  has_many :contacts

  # Authentication
  has_secure_password

  # Validations
  validates :first_name,
            :last_name,
            :email,
            :password,
            presence: true

  validates :email, uniqueness: true
  before_create :assign_default_role

  def assign_default_role
    self.create_role(name: "Regular") if self.role.blank?
  end
end
