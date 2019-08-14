# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'warehouses/show', type: :view do
  before(:each) do
    @warehouse = assign(:warehouse, Warehouse.create!(
                                      {name: 'Name',
                                      pincode: 'Pincode',
                                      max_capacity: 2}
                                    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Pincode/)
    expect(rendered).to match(/2/)
  end
end
