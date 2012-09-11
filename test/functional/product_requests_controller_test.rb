require 'test_helper'

class ProductRequestsControllerTest < ActionController::TestCase
def setup
    @product_request = FactoryGirl.create(:product_request)
  end

  test "should get index" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :index
    assert_not_nil assigns(:product_requests)
    assert_response :success
  end

  test "should get show" do
    get :show, id: @product_request
    assert_response :redirect
  end

   test "should get new" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :new
    assert_not_nil assigns(:product_request)
    assert_response :success
  end

   test "should get edit" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :edit, id: @product_request
    assert_not_nil assigns(:product_request)
    assert_response :success
  end

  test "should get create" do
  user = FactoryGirl.create(:user)
  cart = FactoryGirl.create(:cart_with_1_row)
  sign_in(user)

  product = FactoryGirl.create(:product)
  assert_difference('ProductRequest.count') do
    post :create, { product_request: FactoryGirl.attributes_for(:product_request, user: user.id, product: product.id) }, { cart_id: cart.id }.merge(session)
  end
end


  test "should get update" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :update, id: @product_request
    assert_not_nil assigns(:product_request)
    assert_response :redirect
  end

   test "should get destroy" do
    get :destroy, id: @product_request
    assert_response :redirect
  end
end
