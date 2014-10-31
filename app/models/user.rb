class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets
  
  has_many :user_followers
  has_many :followers, through: :user_followers

	has_many :following_users, class_name: 'UserFollower', foreign_key: 'follower_id'
	has_many :following, through: :following_users, source: :user
end
