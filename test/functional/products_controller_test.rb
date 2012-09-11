require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  
   def setup
    @product = FactoryGirl.create(:product)
  end

  test "should get index" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :index
    assert_not_nil assigns(:products)
    assert_response :success
  end

  test "should get show" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :show, id: @product
    assert_response :success
    assert_not_nil assigns(:product)
  end

   test "should get new" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :new
    assert_not_nil assigns(:product)
    assert_response :success
  end

   test "should get edit" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :edit, id: @product
    assert_not_nil assigns(:product)
    assert_response :success
  end

   test "should get create" do
    sign_in(FactoryGirl.create(:user, admin: true))
    assert_difference('Product.count') do
       post :create, product: FactoryGirl.attributes_for(:product)
    end
    assert_not_nil assigns(:product)
    assert_response :redirect
  end

  test "should get update" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :update, id: @product
    assert_not_nil assigns(:product)
    assert_response :redirect
  end

   test "should get destroy" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :destroy, id: @product
    assert_response :redirect
  end
end
