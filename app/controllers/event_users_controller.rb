class EventUsersController < ApplicationController
  def create
    event_user = current_user.event_users.build(event_id: params[:event_id])
    event_user.save

    redirect_back(fallback_location: root_path) #神コード
  end

  def destroy
    event_user =
      EventUser.find_by(event_id: params[:event_id], user_id: current_user.id)
    event_user.destroy

    redirect_back(fallback_location: root_path)
  end
end
