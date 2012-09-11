require 'test_helper'

class ProductRequestsTest < ActiveSupport::TestCase
  def setup

  @product_request = FactoryGirl.create(:product_request)
  end

  test "valid event must be valid" do
    assert_respond_to @product_request, :quantity
    assert_respond_to @product_request, :product_id
    assert_respond_to @product_request, :user_id
    assert_respond_to @product_request, :city
    assert_respond_to @product_request, :street
    assert_respond_to @product_request, :state
    assert @product_request.valid?
  end

  test "product_id must be a number" do
    @product_request.product_id = 'a string'
     assert !@product_request.valid?
  end

   test "product_id should not be nil" do
    @product_request.product_id = nil
     assert !@product_request.valid?
  end

test "user_id must be a number" do
    @product_request.user_id = 'a string'
     assert !@product_request.valid?
  end

  test "user_id should not be nil" do
    @product_request.user_id = nil
     assert !@product_request.valid?
  end

  test "street should not be blank" do
    @product_request.street = "    "
    assert !@product_request.valid?
  end

   test "city should not be blank" do
    @product_request.city = "    "
    assert !@product_request.valid?
  end

  test "state should not be blank" do
    @product_request.state = "    "
    assert !@product_request.valid?
  end

  test "zip should not be blank" do
    @product_request.zip = "    "
    assert !@product_request.valid?
  end
end
