class ProductRequestsController < ApplicationController

  before_filter :require_sign_in, only: [:new, :create]
  before_filter :require_admin, only: [:index, :show ]

  def index
    @product_requests = ProductRequest.paginate(:page => params[:page]).order("status")
  end
  def show
    render nothing: true
  end


  def new
     @product_request = ProductRequest.new
      @cart = current_cart
  end

  def edit
    @product_request = ProductRequest.find(params[:id])
  end

 def create
  @cart = current_cart
  rows = CartRow.find_all_by_cart_id(@cart.id)
  
  rows.each do |row|
    @product_request = ProductRequest.new(params[:product_request])
    @product_request.user_id = current_user.id
    @product_request.cart_id = @cart.id
    @product_request.product_id = row.product_id
    @product_request.quantity = row.quantity
    unless @product_request.save
      render 'new'
      return
    end
  end
  flash[:success] = "Products Ordered"
  redirect_to cart_url(@cart)
 end

 def update
    @product_request = ProductRequest.find(params[:id])
    if @product_request.update_attributes(params[:product_request])
      redirect_to product_requests_path, flash: {success: "Product Request Updated!"}
    else
      render 'edit'
    end
 end
 
  def destroy
    product_request = ProductRequest.find(params[:id]).destroy
    flash[:success] = "Product Request Deleted."
    redirect_to product_requests_path
  end
end
