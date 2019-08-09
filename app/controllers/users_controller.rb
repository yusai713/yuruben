class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(current_user.id) #現在ログインしているユーザーのレコードを呼び出す。
    @events = @user.events
    @user_events = @user.user_events
  end
end
