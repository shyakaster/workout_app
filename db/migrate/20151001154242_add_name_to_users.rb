class AddNameToUsers < ActiveRecord::Migration
  def up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
  def down
    remove_columns :users, :first_name,:last_name

  end
end
