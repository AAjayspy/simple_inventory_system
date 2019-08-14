# frozen_string_literal: true

class Warehouse < ApplicationRecord
  extend UniqueTokensLib
  after_initialize :set_access_token

  has_many :inventory, dependent: :destroy
  has_many :products, through: :inventory

  # Validation
  validates :wh_code, :name, :pincode, :max_capacity, presence: true
  validates :wh_code, uniqueness: true, length: { in: 4..16 }
  validates :max_capacity, numericality: { only_integer: { greater_than: 0 } }

  # Inventory table data population
  def generate_inventory(products, below_threshold = false, new_form_warehouse = false)
    products.each do |product|
      count = if new_form_warehouse
                0
              elsif below_threshold
                rand(1..THRESHOLD_LIMIT - 1)
              else
                rand(THRESHOLD_LIMIT + 1..50)
              end
      inventory.create!(product: product, item_count: count, low_item_threshold: THRESHOLD_LIMIT)
    end
  end

  private

  def set_access_token
    # WH_CODE :  is defined in initializers/constants.rb
    self.wh_code = Warehouse.generate_token(rand(2..WH_CODE)) if new_record?
  end
end
