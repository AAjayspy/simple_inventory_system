# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'inventories/new', type: :view do
  before(:each) do
    assign(:inventory, Inventory.new(
                         product: nil,
                         warehouse: nil,
                         item_count: 1,
                         low_item_threshol: 1
                       ))
  end

  it 'renders new inventory form' do
    render

    assert_select 'form[action=?][method=?]', inventories_path, 'post' do
      assert_select 'input[name=?]', 'inventory[product_id]'

      assert_select 'input[name=?]', 'inventory[warehouse_id]'

      assert_select 'input[name=?]', 'inventory[item_count]'

      assert_select 'input[name=?]', 'inventory[low_item_threshol]'
    end
  end
end
