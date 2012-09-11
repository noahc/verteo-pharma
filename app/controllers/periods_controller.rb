class PeriodsController < ApplicationController
  before_filter :require_admin

  def index
    @periods = Period.all
  end

  def show
    @period = Period.find(params[:id])
    @registered = PeriodRegistration.find_all_by_period_id(@period.id)
  end

  def new
    @period = Period.new
    @events = Event.all
  end

  def edit
    @period = Period.find(params[:id])
  end

  def create
    @period = Period.new(params[:period])
    if @period.save
      redirect_to event_url(@period.event)
    else
      render 'new'
    end
  end

  def update
    @period = Period.find(params[:id])
    if @period.update_attributes(params[:period])
      redirect_to event_url(@period.event), flash: {success: "Session Updated!"}
    else
      render 'edit'
    end
  end

  def destroy
    period = Period.find(params[:id]).destroy
    redirect_to event_url(period.event)
  end

end
