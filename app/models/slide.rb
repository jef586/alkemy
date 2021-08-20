# frozen_string_literal: true

class Slide < ApplicationRecord
  # Active Storage
  has_one_attached :image
  # Associations
  belongs_to :organization
  # Callbacks
  before_create :before_create_adjustment
  # Validations
  validates :text,
            presence: true
  validates :order,
            numericality: { only_integer: true, greater_than_or_equal_to: 1 },
            allow_nil: true
  validates :image, presence: true, blob: { content_type: :image, size_range: 1..3.megabytes }
  # Scopes
  scope :where_order_greater_equal_than, -> (order) { where("slides.order >= ?", order) }
  # Methods
  def set_default_order
    self.order = self.class.count + 1
  end
  def before_create_adjustment
    return unless self.errors.empty?
    if self.order.nil? || self.order > self.class.count
      self.set_default_order
    else # In case order is already taken.
      self.adjust_order
    end
  end

  private
    def adjust_order
      self.class.where_order_greater_equal_than(self.order)
                .each do |slide|
        slide.order += 1
        slide.save(validate: false)
      end
    end
end
