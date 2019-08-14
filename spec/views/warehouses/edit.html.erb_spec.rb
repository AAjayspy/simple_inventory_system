# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'warehouses/edit', type: :view do
  before(:each) do
    @warehouse = assign(:warehouse, Warehouse.create!(
                                      name: 'MyString',
                                      pincode: 'MyString',
                                      max_capacity: 1
                                    ))
  end

  it 'renders the edit warehouse form' do
    render

    assert_select 'form[action=?][method=?]', warehouse_path(@warehouse), 'post' do
      
      assert_select 'input[name=?]', 'warehouse[name]'

      assert_select 'input[name=?]', 'warehouse[pincode]'

      assert_select 'input[name=?]', 'warehouse[max_capacity]'
    end
  end
end
