class FixColumnNameUserToAsker < ActiveRecord::Migration[6.0]
  def change
  rename_column :friendships, :user_id, :asker_id
  rename_column :friendships, :friend_id, :receiver_id
  end
end
