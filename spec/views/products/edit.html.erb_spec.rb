# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'products/edit', type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
                                  name: 'MyString',
                                  price: '9.99'
                                ))
  end

  it 'renders the edit product form' do
    render
  end
end
