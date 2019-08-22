require 'date'

class EventsController < ApplicationController

  def def(move_to_index)
    redirect_to action: :index unless user_signed_in?
  end

  def index
    @events = Event.where("starts_at  > ?", DateTime.now).order(:starts_at)
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(
      name: event_params[:name],
      contents: event_params[:contents],
      thumbnail: event_params[:thumbnail],
      starts_at: event_params[:starts_at],
      user_id: current_user.id
    )

    redirect_to action: :index
  end

  def edit
    @event = find_event_by_id
  end

  def update
    event = find_event_by_id
    event.update(event_params)

    redirect_to event_path(event.id)
  end

  def show
    @event = find_event_by_id
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy

    redirect_to events_path
  end

   def back_number
    @events = Event.where("starts_at  < ?", DateTime.now).order(:starts_at)
   end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :contents,
      :thumbnail,
      :remove_thumbnail,
      :starts_at
    )
  end

  #ストロングパラメーターを使って、idに紐づいたユーザーレコードの取得。（使い回しのためメソッド化）
  def find_event_by_id
    Event.find(params[:id])
  end

end
