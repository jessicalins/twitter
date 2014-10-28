class AddUserRefToUserFollower < ActiveRecord::Migration
  def change
    add_reference :user_followers, :user, index: true
  end
end
