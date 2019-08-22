class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable

  has_many :events, dependent: :destroy
  has_many :event_users
  has_many :user_events, through: :event_users, source: :event

  mount_uploader :image, ImageUploader

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    #binding.irb
    unless user
      user =
        User.create(
          uid: auth.uid,
          provider: auth.provider,
          email: User.dummy_email(auth),
          password: Devise.friendly_token[0, 20],
          image: auth.info.image,
          name: auth.info.name
        )
    end

    user
  end

  private

  def self.dummy_email(auth)
    'test@example.com'
  end
end
