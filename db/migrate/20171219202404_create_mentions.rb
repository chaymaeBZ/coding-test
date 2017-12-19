class CreateMentions < ActiveRecord::Migration[5.1]
  def change
    create_table :mentions do |t|
      t.integer :tweet_id, limit: 8
      t.string :username
      t.string :text

      t.timestamps
    end
  end
end
