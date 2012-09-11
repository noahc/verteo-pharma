class EventsController < ApplicationController

  before_filter :require_admin, only: [:edit, :update, :new, :create, :destroy]

  def index
    @events = Event.all.sort_by &:date
  end

  def show
    @event = Event.find(params[:id])
    @periods = Period.find_all_by_event_id(@event.id).sort_by &:start_time
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to events_url
    else
      render 'new'
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to events_url, flash: {success: "Product Request Updated!"}
    else
      render 'edit'
    end
  end

  def destroy
    event = Event.find(params[:id]).destroy
    flash[:success] = "Event Deleted."
    redirect_to events_url
  end
end
