# == Schema Information
#
# Table name: products
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  description :text
#  stock       :integer
#  limit       :integer
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product= FactoryGirl.create(:product)
  end
  
  test "valid product must be valid" do
    assert_respond_to @product, :name
    assert_respond_to @product, :stock
    assert_respond_to @product, :limit
    assert_respond_to @product, :description
    assert @product.valid?
  end

  test "name can't be blank " do
    @product.name = "     "
    assert !@product.valid?
  end

  test "name can't be nil" do
     @product.name = nil
    assert !@product.valid?
  end

  test "stock must be a number" do
     @product.stock = 'string'
    assert !@product.valid?
  end

  test "limit must be a number" do
     @product.limit = 'string'
    assert !@product.valid?
  end

  test "description must not be blank" do
     @product.name = "     "
    assert !@product.valid?
  end
end
