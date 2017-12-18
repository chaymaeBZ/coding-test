class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.string :body

      t.timestamps
    end
  end
end
