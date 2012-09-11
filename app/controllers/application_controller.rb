class ApplicationController < ActionController::Base
  protect_from_forgery


  private
    def current_cart 
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound 
      cart = Cart.create 
      session[:cart_id] = cart.id
      cart
    end


    def require_admin
      redirect_to root_path, notice: "Invalid Action" unless user_signed_in? && current_user.admin?
    end

    def require_sign_in
      redirect_to new_user_session_path, notice: "Please sign in." unless user_signed_in?
    end

    def require_correct_user
    end
end
