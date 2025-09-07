class EventAttendancesController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    unless current_user.attended_events.include?(@event)
      current_user.attended_events << @event
    end
    redirect_to @event, notice: "You are now attending this event."
  end

  def destroy
    @event = Event.find(params[:event_id])
    if current_user.attended_events.include?(@event)
      current_user.attended_events.delete(@event)
    end
    redirect_to @event, notice: "You have removed your attendance."
  end
end
