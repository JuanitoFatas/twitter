class CreateFollowingRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :following_relationships do |t|
      t.references :follower, null: false, foreign_key: { to_table: :users }
      t.references :followed_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
