class Product < ApplicationRecord
  extend UniqueTokensLib
  after_initialize :set_access_token

  has_many :inventory, dependent: :destroy
  has_many :warehouses, through: :inventory

  validates :sku_code, :name, :price, presence: true
  validates :sku_code, uniqueness: true, length: { is: 8 }
  validates :price, numericality: true

  accepts_nested_attributes_for :inventory

  private
  def set_access_token
    # SKU_CODE :  is defined in initializers/constants.rb
    self.sku_code = Product.generate_token(SKU_CODE) if self.new_record?
  end
end
