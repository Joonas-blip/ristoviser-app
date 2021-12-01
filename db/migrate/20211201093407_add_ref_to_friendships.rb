class AddRefToFriendships < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :friendships, :users, column: :receiver_id
  end
end
