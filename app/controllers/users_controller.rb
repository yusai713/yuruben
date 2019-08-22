class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(current_user.id) #現在ログインしているユーザーのレコードを呼び出す。
    @events = @user.events #該当ユーザーに紐づくeventを呼び出す。
    @user_events = @user.user_events
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    redirect_to users_path
  end
end
