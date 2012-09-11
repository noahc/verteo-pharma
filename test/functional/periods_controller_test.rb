require 'test_helper'

class PeriodsControllerTest < ActionController::TestCase
 

  def setup
    @period = FactoryGirl.create(:period)
  end

  test "should get index" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :index
    assert_not_nil assigns(:periods)
    assert_response :success
  end

  test "should get show" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :show, id: @period
    assert_response :success
    assert_not_nil assigns(:period)
  end


   test "should get new" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :new
    assert_not_nil assigns(:period)
    assert_response :success
  end

   test "should get edit" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :edit, id: @period
    assert_not_nil assigns(:period)
    assert_response :success
  end

   test "should post create" do
    sign_in(FactoryGirl.create(:user, admin: true))
    event = FactoryGirl.create(:event)
    assert_difference('Period.count') do
      post :create, period: FactoryGirl.attributes_for(:period, event_id: event.id)
    end
    assert_not_nil assigns(:period)
    assert_response :redirect
  end

  test "should get update" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :update, id: @period
    assert_not_nil assigns(:period)
    assert_response 302
  end

   test "should get destroy" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :destroy, id: @period
    assert_response :redirect 
  end
end
