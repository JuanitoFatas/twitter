class AddFollowingRelationshipCounterCachesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :followed_users_count, :integer, default: 0, null: false
    add_column :users, :followers_count, :integer, default: 0, null: false
  end
end
