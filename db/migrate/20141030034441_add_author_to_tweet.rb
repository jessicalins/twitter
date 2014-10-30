class AddAuthorToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :author, :string
  end
end
