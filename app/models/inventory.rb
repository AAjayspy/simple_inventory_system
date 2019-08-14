# frozen_string_literal: true

class Inventory < ApplicationRecord
  belongs_to :product
  belongs_to :warehouse

  # Validation
  validates :item_count, :low_item_threshold, presence: true
  validates :item_count, :low_item_threshold, numericality: true
end
