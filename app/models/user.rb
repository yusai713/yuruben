class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :events
  has_many :event_users
  has_many :user_events, through: :event_users, source: :event

  mount_uploader :image, ImageUploader
end
