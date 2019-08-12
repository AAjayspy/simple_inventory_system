require 'rails_helper'

RSpec.describe "warehouses/new", type: :view do
  before(:each) do
    assign(:warehouse, Warehouse.new(
      :wh_code => "MyString",
      :name => "MyString",
      :name => "MyString",
      :pincode => "MyString",
      :max_capacity => 1
    ))
  end

  it "renders new warehouse form" do
    render

    assert_select "form[action=?][method=?]", warehouses_path, "post" do

      assert_select "input[name=?]", "warehouse[wh_code]"

      assert_select "input[name=?]", "warehouse[name]"

      assert_select "input[name=?]", "warehouse[name]"

      assert_select "input[name=?]", "warehouse[pincode]"

      assert_select "input[name=?]", "warehouse[max_capacity]"
    end
  end
end
