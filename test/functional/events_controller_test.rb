require 'test_helper'

class EventsControllerTest < ActionController::TestCase

  def setup
    @event = FactoryGirl.create(:event)
  end

  test "should get index" do
    get :index
    assert_not_nil assigns(:events)
    assert_response :success
  end

  test "should get show" do
    get :show, id: @event
    assert_response :success
    assert_not_nil assigns(:event)
  end

   test "should get new" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :new
    assert_not_nil assigns(:event)
    assert_response :success
  end

   test "should get edit" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :edit, id: @event
    assert_not_nil assigns(:event)
    assert_response :success
  end

   test "should get create" do
    sign_in(FactoryGirl.create(:user, admin: true))
     assert_difference('Event.count') do
      post :create, event: FactoryGirl.attributes_for(:event)
    end
    assert_not_nil assigns(:event)
   
    assert_response :redirect
  end

  test "should get update" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :update, id: @event
    assert_not_nil assigns(:event)
    assert_response :redirect
  end

   test "should get destroy" do
    sign_in(FactoryGirl.create(:user, admin: true))
    get :destroy, id: @event
    assert_response :redirect
  end
end
