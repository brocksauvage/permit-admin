class AddRolesToUsers < ActiveRecord::Migration[6.0]
  def up
    execute "CREATE TYPE role AS ENUM ('manager', 'user');"
    add_column :users, :role, :role, default: 'user'
  end

  def down
    drop_column :users, :role, :role
    execute 'DROP type role;'
  end
end
