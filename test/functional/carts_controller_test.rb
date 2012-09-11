require 'test_helper'

class CartsControllerTest < ActionController::TestCase

  def setup
    @cart = FactoryGirl.create(:cart_with_1_row)
  end

  test "should get show" do
    sign_in(FactoryGirl.create(:user, admin: true))
    FactoryGirl.create(:product_request)
    session[:cart_id] = @cart.id
    get :show, id: @cart.id
    assert_response :success
    assert_not_nil assigns(:product_requests)
  end

end
