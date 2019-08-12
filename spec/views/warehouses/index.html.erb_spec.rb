require 'rails_helper'

RSpec.describe "warehouses/index", type: :view do
  before(:each) do
    assign(:warehouses, [
      Warehouse.create!(
        :wh_code => "Wh Code",
        :name => "Name",
        :name => "Name",
        :pincode => "Pincode",
        :max_capacity => 2
      ),
      Warehouse.create!(
        :wh_code => "Wh Code",
        :name => "Name",
        :name => "Name",
        :pincode => "Pincode",
        :max_capacity => 2
      )
    ])
  end

  it "renders a list of warehouses" do
    render
    assert_select "tr>td", :text => "Wh Code".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Pincode".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
