class Inventory < ApplicationRecord
  belongs_to :product
  belongs_to :warehouse

  validates :item_count, :low_item_threshold, presence: true
  validates :item_count, :low_item_threshold, numericality: true
end
