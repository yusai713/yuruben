class Event < ApplicationRecord
  belongs_to :user
  has_many :event_users, dependent: :destroy

  def event_user?(user)
    event_users.where(user_id: user.id).exists?
  end

  mount_uploader :thumbnail, ThumbnailUploader
end
