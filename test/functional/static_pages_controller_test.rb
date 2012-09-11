require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

 test "should get profile" do
    sign_in(FactoryGirl.create(:user))
    get :profile
    assert_not_nil assigns(:sessions)
    assert_not_nil assigns(:inqueries)
    assert_not_nil assigns(:product_requests)
    assert_response :success
  end

  test "should get analytics" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :analytics
    assert_not_nil assigns(:product_count)
    assert_not_nil assigns(:product_request_product_count)
    assert_not_nil assigns(:inquery_product_count)
    assert_not_nil assigns(:user_count)
    assert_not_nil assigns(:period_registration_count)
    assert_not_nil assigns(:product_request_count)
    assert_not_nil assigns(:inquery_count)
    assert_response :success
  end

  test "should get user_index" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :user_index
    assert_not_nil assigns(:users)
  end

  test "should post toggle_admin" do
    user = FactoryGirl.create(:user, admin: true)
    sign_in(user)
    before_value = user.admin
    post :toggle_admin, id: user.id
    after_value = user.reload.admin
    assert_not_equal before_value, after_value
    assert_response :redirect
  end

end
