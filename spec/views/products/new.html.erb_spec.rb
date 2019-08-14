# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'products/new', type: :view do
  before(:each) do
    assign(:product, Product.new(
                       sku_code: 'MyString',
                       name: 'MyString',
                       price: '9.99'
                     ))
  end

  it 'renders new product form' do
    render
  end
end
