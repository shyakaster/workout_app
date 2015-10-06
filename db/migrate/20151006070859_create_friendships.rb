class CreateFriendships < ActiveRecord::Migration
  def up
    create_table :friendships do |t|
      t.references :user, index: true
      t.references :friend, index: true
      t.timestamps null: false
    end
  end
  def down
    drop_table :friendships
  end
end
