class StaticPagesController < ApplicationController

  before_filter :require_admin, only: [:analytics, :user_index, :make_admin]
  before_filter :require_sign_in, only: [:profile]

  def profile
    @sessions = PeriodRegistration.find_all_by_user_id(current_user.id, order: "created_at DESC")
    @inqueries = Inquery.find_all_by_user_id(current_user.id, order: "created_at DESC")
    @product_requests = ProductRequest.find_all_by_user_id(current_user.id, order: "created_at DESC")
  end

  def analytics
    user_registrations = User.count(:conditions => ["created_at >= ?", 30.days.ago.to_date], group: "date(created_at)")
    period_registration = PeriodRegistration.count(:conditions => ["created_at >= ?", 30.days.ago.to_date], group: "date(created_at)")
    period_registration_product = PeriodRegistration.joins(:period).where("period_registrations.created_at >= ?", 30.days.ago.to_date).group("periods.product_id").count
    product_requests = ProductRequest.count(:conditions => ["created_at >= ?", 30.days.ago.to_date], group: "date(created_at)")
    product_request_product = ProductRequest.joins(:product).where("product_requests.created_at >= ?", 30.days.ago.to_date).group("product_requests.product_id").count
    inqueries = Inquery.count(:conditions => ["created_at >= ?", 30.days.ago.to_date], group: "date(created_at)")
    inquery_product = Inquery.joins(:product).where("inqueries.created_at >= ?", 30.days.ago.to_date).group("inqueries.product_id").count
    
    @product_count = []

    period_registration_product.each do |key, value|
      @product_count << [Product.find_by_id(key).name, value]
    end

    #product_request_count

    @product_request_product_count = []

    product_request_product.each do |key, value|
     @product_request_product_count << [Product.find_by_id(key).name, value]
    end

    #inquery_product_count

    @inquery_product_count = []

    inquery_product.each do |key, value|
     @inquery_product_count << [Product.find_by_id(key).name, value]
    end

    @user_count = []
    30.times do |day|
      count = user_registrations["#{Date.today - day}"] || 0
      @user_count << count
    end

    @period_registration_count = []
    30.times do |day|
      count = period_registration["#{Date.today - day}"] || 0
      @period_registration_count << count
    end

    @product_request_count = []
    30.times do |day|
      count = product_requests["#{Date.today - day}"] || 0
      @product_request_count << count
    end

    @inquery_count = []
     30.times do |day|
      count = inqueries["#{Date.today - day}"] || 0
      @inquery_count << count
    end
  end

  def user_index
    @users = User.where("email like ?", "%@example.com%").paginate(:page => params[:page]).order("last_name")
  end

  def toggle_admin
    user = User.find_by_id(params[:id])
    user.toggle!(:admin)
    redirect_to list_path
  end
end
