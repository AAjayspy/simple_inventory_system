# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_812_050_727) do
  create_table 'inventories', force: :cascade do |t|
    t.integer 'product_id'
    t.integer 'warehouse_id'
    t.integer 'item_count'
    t.integer 'low_item_threshold'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['product_id'], name: 'index_inventories_on_product_id'
    t.index ['warehouse_id'], name: 'index_inventories_on_warehouse_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'sku_code', limit: 8
    t.string 'name'
    t.decimal 'price', precision: 8, scale: 2
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['sku_code'], name: 'index_products_on_sku_code', unique: true
  end

  create_table 'warehouses', force: :cascade do |t|
    t.string 'wh_code', limit: 16
    t.string 'name'
    t.string 'pincode'
    t.integer 'max_capacity'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['wh_code'], name: 'index_warehouses_on_wh_code', unique: true
  end
end
