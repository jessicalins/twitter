class UserFollower < ActiveRecord::Base
	belongs_to :user
	belongs_to :follower, class_name: 'User'
	has_many :following_users, class_name: 'UserFollower'
	has_many :following, through: :following_users, source: :follower
end
