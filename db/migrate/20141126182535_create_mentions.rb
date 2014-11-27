class CreateMentions < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
      t.string :content
      t.references :user, index: true
      t.references :tweet, index: true

      t.timestamps
    end
  end
end
