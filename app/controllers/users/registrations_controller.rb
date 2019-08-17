# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def edit
    @user = User.find(current_user.id)
  end

  def update
    user = User.find(current_user.id)
    user.update(user_params)
    redirect_to user_path(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile, :image, :remove_image)
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
