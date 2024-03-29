# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'products/index', type: :view do
  before(:each) do
    assign(:products, [
             Product.create!(
               sku_code: 'Sku Code',
               name: 'Name',
               price: '9.99'
             ),
             Product.create!(
               sku_code: 'Sku Code',
               name: 'Name',
               price: '9.99'
             )
           ])
  end

  it 'renders a list of products' do
    render
    assert_select 'tr>td', text: 'Sku Code'.to_s, count: 2
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
  end
end
