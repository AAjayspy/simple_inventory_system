require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :sku_code => "Sku Code",
      :name => "Name",
      :price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sku Code/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
  end
end
