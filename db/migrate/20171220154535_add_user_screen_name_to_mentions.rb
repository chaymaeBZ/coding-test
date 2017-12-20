class AddUserScreenNameToMentions < ActiveRecord::Migration[5.1]
  def change
    add_column :mentions, :user_screen_name, :string
  end
end
