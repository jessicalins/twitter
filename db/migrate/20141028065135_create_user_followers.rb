class CreateUserFollowers < ActiveRecord::Migration
  def change
    create_table :user_followers do |t|

      t.timestamps
    end
  end
end
