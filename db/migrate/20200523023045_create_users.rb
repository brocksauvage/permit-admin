class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.belongs_to :team, type: :uuid, index: true, null: false
      t.timestamps
    end
  end
end
