require 'test_helper'

class InqueriesControllerTest < ActionController::TestCase
 
 def setup
    @inquery = FactoryGirl.create(:inquery)
  end

  test "should get index" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :index
    assert_not_nil assigns(:inqueries)
    assert_response :success
  end

  test "should get show" do
    sign_in(FactoryGirl.create(:user))
    get :show, id: @inquery
    assert_response :success
    assert_not_nil assigns(:inquery)
  end

   test "should get new" do
    sign_in(FactoryGirl.create(:user))
    get :new
    assert_not_nil assigns(:inquery)
    assert_response :success
  end

  test "should get edit" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :edit, id: @inquery
    assert_not_nil assigns(:inquery)
    assert_response :success
  end

   test "should get create" do
   sign_in(FactoryGirl.create(:user))
    assert_difference('Inquery.count') do
     post :create, inquery: FactoryGirl.attributes_for(:inquery)
    end
    assert_not_nil assigns(:inquery)
    assert_response :redirect
  end

  test "should get update" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :update, id: @inquery
    assert_not_nil assigns(:inquery)
    assert_response :success
  end

   test "should get destroy" do
    get :destroy, id: @inquery
    # assert_response :success
  end
end
