# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'inventories/index', type: :view do
  before(:each) do
    assign(:inventories, [
             Inventory.create!(
               product: nil,
               warehouse: nil,
               item_count: 2,
               low_item_threshol: 3
             ),
             Inventory.create!(
               product: nil,
               warehouse: nil,
               item_count: 2,
               low_item_threshol: 3
             )
           ])
  end

  it 'renders a list of inventories' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
  end
end
