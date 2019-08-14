# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'warehouses/index', type: :view do
  before(:each) do
    assign(:warehouses, [
             Warehouse.create!(
               name: 'Name',
               pincode: 'Pincode',
               max_capacity: 2
             ),
             Warehouse.create!(
               name: 'Name',
               pincode: 'Pincode',
               max_capacity: 2
             )
           ])
  end

  it 'renders a list of warehouses' do
    render
  end
end
