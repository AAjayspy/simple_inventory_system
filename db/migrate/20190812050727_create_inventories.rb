class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.references :product, foreign_key: true
      t.references :warehouse, foreign_key: true
      t.integer :item_count
      t.integer :low_item_threshol

      t.timestamps
    end
  end
end
