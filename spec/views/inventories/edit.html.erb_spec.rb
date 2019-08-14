# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'inventories/edit', type: :view do
  before(:each) do
    @inventory = assign(:inventory, Inventory.create!(
                                      product: nil,
                                      warehouse: nil,
                                      item_count: 1,
                                      low_item_threshol: 1
                                    ))
  end

  it 'renders the edit inventory form' do
    render

    assert_select 'form[action=?][method=?]', inventory_path(@inventory), 'post' do
      assert_select 'input[name=?]', 'inventory[product_id]'

      assert_select 'input[name=?]', 'inventory[warehouse_id]'

      assert_select 'input[name=?]', 'inventory[item_count]'

      assert_select 'input[name=?]', 'inventory[low_item_threshol]'
    end
  end
end
