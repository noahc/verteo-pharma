class CartsController < ApplicationController
  def show
    cart = current_cart
    @product_requests = ProductRequest.find_all_by_cart_id(cart.id)
    cart.destroy
  end
end
