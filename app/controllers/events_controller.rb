class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(
      name: event_params[:name],
      contents: event_params[:contents],
      user_id: current_user.id
    )

    redirect_to action: :index
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private

  def event_params
    params.require(:event).permit(:name, :contents)
  end
end
