# frozen_string_literal: true

class Commentary < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true

  # Validations
  validates :body, presence: true
  # scopes
  scope :for_creation_date, -> (date_of_creation) { where date_of_creation: date_of_creation }
  scope :for_body, -> (body) { where body: body }
end
