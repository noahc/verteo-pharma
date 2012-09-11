# == Schema Information
#
# Table name: cart_rows
#
#  id         :integer         not null, primary key
#  product_id :integer
#  cart_id    :integer
#  quantity   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'test_helper'

class CartRowTest < ActiveSupport::TestCase
  def setup
    @cart_row = FactoryGirl.create(:cart_row)
  end

  test "valid cart_row must be valid" do
    assert_respond_to @cart_row, :product_id
    assert_respond_to @cart_row, :cart_id
    assert_respond_to @cart_row, :quantity
    assert @cart_row.valid?
  end
end
