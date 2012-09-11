class CartRowsController < ApplicationController

  before_filter :require_sign_in, only: [:new, :create, :destroy]

  # def index
  #   @cart_rows = CartRow.all
  # end

  # def show
  #   @cart_rows = CartRow.find(params[:id])
  # end

  def new
    @cart_row = CartRow.new
  end

  # def edit
  #   @cart_row = CartRow.find(params[:id])
  # end

  def create
    @cart_row = CartRow.new
    if !@cart_row.add_product(params[:product_id], current_cart)
      flash[:notice] = "You have exceded the max in stock or the single customer limit"
    end
    redirect_to products_url
  end

  # def update
  #   @cart_row = CartRow.find(params[:id])
  # end

  def destroy
    cart_row = CartRow.find(params[:id]).destroy
    flash[:success] = "Product Removed."
    redirect_to products_url
  end
end
