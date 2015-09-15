class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :tweets

  has_many :mentions
  has_many :tweet_mentions, through: :mentions, source: :tweet
  
  has_many :user_followers
  has_many :followers, through: :user_followers

  has_many :following_users, class_name: 'UserFollower', foreign_key: 'follower_id'
  has_many :following, through: :following_users, source: :user

  def to_param
    username
  end
end
