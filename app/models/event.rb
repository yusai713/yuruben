class Event < ApplicationRecord
  belongs_to :user
  has_many :event_users

  def event_user?(user)
    event_users.where(user_id: user.id).exists?
  end
end
