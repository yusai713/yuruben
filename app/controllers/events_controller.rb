class EventsController < ApplicationController

  def def(move_to_index)
    redirect_to action: :index unless user_signed_in?
  end

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
      thumbnail: event_params[:thumbnail],
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

  private

  def event_params
    params.require(:event).permit(
      :name,
      :contents,
      :thumbnail,
      :remove_thumbnail
    )
  end

  #ストロングパラメーターを使って、idに紐づいたユーザーレコードの取得。（使い回しのためメソッド化）
  def find_event_by_id
    Event.find(params[:id])
  end

end
