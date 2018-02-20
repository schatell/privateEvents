class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @current_user = User.find_by_id(session[:current_user_id])
    @event = @current_user.events.create(event_param)
    if @event.save
      redirect_to event_url(@event)
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

    def event_param
      params.require(:event).permit(:location, :date, :description)
    end
end
