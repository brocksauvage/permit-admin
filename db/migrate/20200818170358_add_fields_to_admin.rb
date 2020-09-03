class AddFieldsToAdmin < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :first_name, :string
    add_column :admins, :last_name, :string
    add_column :admins, :role, :string
    add_reference :admins, :team, index: true
  end
end
