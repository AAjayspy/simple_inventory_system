# frozen_string_literal: true

class CreateWarehouses < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouses do |t|
      t.string :wh_code, limit: 16
      t.string :name
      t.string :pincode
      t.integer :max_capacity

      t.timestamps
    end
    add_index :warehouses, :wh_code, unique: true
  end
end
