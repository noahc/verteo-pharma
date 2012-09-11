require 'test_helper'

class CartRowsControllerTest < ActionController::TestCase

  def setup
    @cart_row = FactoryGirl.create(:cart_row)
  end

  # test "should get index" do
  #   get :index
  #   assert_not_nil assigns(:cart_rows)
  # end

  # test "should get show" do
  #   get :show, id: @cart_row
  #   assert_not_nil assigns(:cart_row)
  # end

  test "should get new" do
    sign_in(FactoryGirl.create(:user))
    get :new
    assert_not_nil assigns(:cart_row)
  end

  #  test "should get edit" do
  #   get :edit, id: @cart_row
  #   assert_not_nil assigns(:cart_row)
  # end

   test "should get create" do
    sign_in(FactoryGirl.create(:user))
    product = FactoryGirl.create(:product)
    assert_difference('CartRow.count') do
      post :create, product_id: product.id
    end
    assert_not_nil assigns(:cart_row)
    assert_response :redirect
  end

  # test "should get update" do
  #   get :update, id: @cart_row
  #   assert_not_nil assigns(:cart_row)
  # end

   test "should get destroy" do
    sign_in(FactoryGirl.create(:user))
    get :destroy, id: @cart_row
    assert_response :redirect
  end
end
