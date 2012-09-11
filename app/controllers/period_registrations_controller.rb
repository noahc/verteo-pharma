class PeriodRegistrationsController < ApplicationController
  before_filter :require_sign_in, only: [:save_period, :destroy, :show]
  before_filter :require_admin, only: [:edit, :index, :update]

   def index
    @period_registrations = PeriodRegistration.all
     render :nothing => true
  end

  def show
    @period_registration = PeriodRegistration.find(params[:id])
  end

  def new
    @period_registration = PeriodRegistration.new
     render :nothing => true
  end

  def edit
    @period_registration = PeriodRegistration.find(params[:id])
     render :nothing => true
  end

  def save_period
    @period_registration = PeriodRegistration.new(params[:period_registration])
    @period_registration.save
    flash[:success] = "Successfully Registered for Session."
    redirect_to event_url(@period_registration.period.event)
  end

  def update
    @period_registration = PeriodRegistration.find(params[:id])
     render :nothing => true
  end

  def destroy
    period_registration = PeriodRegistration.find(params[:id]).destroy
    flash[:success] = "Unregistered For Session."
    redirect_to event_url(period_registration.period.event)
  end
end
