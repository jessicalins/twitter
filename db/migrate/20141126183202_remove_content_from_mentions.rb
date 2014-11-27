class RemoveContentFromMentions < ActiveRecord::Migration
  def change
  	remove_column :mentions, :content
  end
end
