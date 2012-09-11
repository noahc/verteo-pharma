class InqueriesController < ApplicationController

  before_filter :require_sign_in, only: [:new, :show, :create]
  before_filter :require_admin, only: [:edit, :update, :delete, :index]

  def index
    @inqueries = Inquery.all
  end

  def show
    @inquery = Inquery.find(params[:id])
  end

  def new
    @inquery = Inquery.new
  end

  def edit
    @inquery = Inquery.find(params[:id])
  end

  def create
    @inquery = Inquery.new(params[:inquery])
    @inquery.user_id = current_user.id
    if @inquery.save
      flash[:success] = "Inquiry Saved"
      redirect_to inquery_path(@inquery)
    else
      render 'new'
    end
  end

  def update
    @inquery = Inquery.find(params[:id])
  end

  def destroy
    redirect_to root_path
  end
end
