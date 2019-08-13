# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
# Seed the db with 60 sample products.
(1..60).each { |i| product = Product.create!(name: "Product #{i}", price: rand(100.2...1000.2).round(2))}

# 3 sample warehouses - Mumbai, New Delhi, and Bangalore
# PRODUCT_THRESHOLD = 10 is defined in initializers/constants.rb
mumbai    = Warehouse.create!(name: 'Mumbai', pincode: '400070', max_capacity: 1000)
bangalore = Warehouse.create!(name: 'Bangalore', pincode: '400080', max_capacity: 1000)
delhi     = Warehouse.create!(name: 'New Delhi', pincode: '400090', max_capacity: 1000)

# A random count and threshold of every product at every warehouse.

# For Mumbai warehouse.
mumbai.generate_inventory(Product.all)

# For Banglore warehouse, one third products below threshold.
bangalore_products_set = Product.all.in_groups(3)
bangalore.generate_inventory(bangalore_products_set[0], true )
bangalore.generate_inventory(bangalore_products_set[1]+bangalore_products_set[2])


# For Delhi warehouse, exactly half the products are below threshold.
delhi_products_set = Product.all.in_groups(2)
delhi.generate_inventory(delhi_products_set[0], true )
delhi.generate_inventory(delhi_products_set[1] )