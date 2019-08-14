# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'products/edit', type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
                                  sku_code: 'MyString',
                                  name: 'MyString',
                                  price: '9.99'
                                ))
  end

  it 'renders the edit product form' do
    render

    assert_select 'form[action=?][method=?]', product_path(@product), 'post' do
      assert_select 'input[name=?]', 'product[sku_code]'

      assert_select 'input[name=?]', 'product[name]'

      assert_select 'input[name=?]', 'product[price]'
    end
  end
end
