class AddFollowerRefToUserFollower < ActiveRecord::Migration
  def change
    add_reference :user_followers, :follower, index: true
  end
end
