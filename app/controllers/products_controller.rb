class ProductsController < ApplicationController

  before_filter :require_sign_in, only: [:index]
  before_filter :require_admin, only: [:new, :edit, :create, :update, :delete]

  def index
    @products = Product.find(:all, :order => 'name')
    @cart = current_cart
  end

  def show
    @cart = current_cart
    @product = Product.find(params[:id])
  end

  def new
    @cart = current_cart
    @product = Product.new
  end

  def edit
    @cart = current_cart
    @product = Product.find(params[:id])
  end

  def create
    @cart = current_cart
    @product = Product.new(params[:product])
    if @product.save
       redirect_to products_url, flash: {success: "Product Created!"}
    else
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to products_url, flash: {success: "Product Updated!"}
    else
      render 'edit'
    end
  end

  def destroy
    if Product.find(params[:id]).destroy
      redirect_to products_path, flash: {success: "Product Deleted!"}
    else
      redirect_to products_path, flash: {error: "Unable to successfully delete project"}
    end
  end
end
