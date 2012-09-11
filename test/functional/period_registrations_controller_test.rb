require 'test_helper'

class PeriodRegistrationsControllerTest < ActionController::TestCase
   def setup
    @period_registration= FactoryGirl.create(:period_registration)
    @period = FactoryGirl.create(:period)
  end

  test "should get index" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :index
    assert_response :success
  end

  test "should get show" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :show, id: @period_registration
    assert_response :success
    assert_not_nil assigns(:period_registration)
  end

   test "should get new" do
    sign_in(FactoryGirl.create(:user))
    get :new
    assert_not_nil assigns(:period_registration)
    assert_response :success
  end

   test "should get edit" do
    sign_in(FactoryGirl.create(:user, admin:true))
    get :edit, id: @period_registration
    assert_not_nil assigns(:period_registration)
    assert_response :success
  end

   test "should post save_period" do
   
    user = FactoryGirl.create(:user)
    sign_in(user)
     assert_difference('PeriodRegistration.count') do
      post :save_period, period_registration: {user_id: user.id, period_id: @period.id}
    end
    assert_not_nil assigns(:period_registration)
   
    assert_response :redirect
  end

  test "should get update" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :update, id: @period_registration
    assert_not_nil assigns(:period_registration)
    assert_response :success
  end

   test "should get destroy" do
    sign_in(FactoryGirl.create(:user))
    get :destroy, id: @period_registration
    assert_response :redirect
  end
end
