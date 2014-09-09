# encoding: UTF-8
class EventsController < InheritedResources::Base
  layout "eventless", only: :index
  actions :index, :show

  def index
    @events = Event.all.select do |event|
      event.registration_periods.ending_after(Time.now).present?
    end
    if @events.size == 1
      redirect_to event_url(@events.first)
    else
      render :index
    end
  end

  skip_before_filter :event, only: :index
  skip_before_filter :authenticate_user!
  skip_before_filter :authorize_action
end